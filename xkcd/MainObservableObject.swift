import Combine
import SwiftUI
import SwiftSoup

class MainObservableObject: ObservableObject {
    
    // main data object
    var mainDataObject: MainDataObject = MainDataObject.shared
    
    // published data objects
    @Published var comic: Comic?
    
    private var favoriteComics: [Comic] = []
    private let comicService: ComicService
    private var cancellables = Set<AnyCancellable>()
    
    @AppStorage("latestComic") var latestComic = 1
    @AppStorage("currentComic") var currentComic = 0
    
    init(service: ComicService) {
        self.comicService = service
    }
    
    func getComic() -> Comic {
        return comic ?? Comic(num: 0, title: "", img: "")
    }
    
    func getNumber() -> String {
        return "#\(comic?.num ?? 0)"
    }
    
    func getTitle() -> String {
        return comic?.title ?? "Loading comic..."
    }
    
    func getImageUrl() -> URL? {
        return comic?.imgUrl
    }
    
    func comicNumbers() -> [String] {
        var numbers: [String] = []
        for item in 1...latestComic {
            numbers.append("\(item)")
        }
        return numbers
    }
    
    func hasSearch(type: ComicBrowserType) -> Bool {
        switch type {
        case .remote:
            return true
        case .favorite:
            return false
        }
    }
}

// MARK: Networking
extension MainObservableObject {

    func update(with data: Comic) {
        comic = data
        currentComic = data.num
    }
    
    func getLatestComic() {
        comicService.fetchLatestComic()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.update(with: result)
                self.latestComic = result.num
            }
            .store(in: &cancellables)
    }
    
    func getComic(withID id: Int) {
        comicService.getComic(withId: id)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.update(with: result)
            }
            .store(in: &cancellables)
    }
    
    func get(_ direction: Direction, type: ComicBrowserType) {
        switch type {
        case .remote:
            get(direction)
        case .favorite:
            fetch(direction)
        }
    }
}

//MARK: Local data fetch
extension MainObservableObject {
    func fetchFavorites() {
        favoriteComics = []
        let favorites = mainDataObject.fetchAllFavoriteComics()
        for fav in favorites {
            let favComic = Comic(num: Int(fav.num),
                                 title: fav.title ?? "",
                                 img: fav.img ?? "")
            favoriteComics.append(favComic)
        }
        comic = favoriteComics.first
    }
    
    func fetch(_ direction: Direction) {
        if var index = favoriteComics.firstIndex(where: {$0 == comic}) {
            index = direction == .previous ? index - 1 : index + 1
            
            guard index < favoriteComics.count, index >= 0 else {
                comic = direction == .previous ? favoriteComics.last : favoriteComics.first
                return
            }
            comic = favoriteComics[index]
        }
    }
    
    func fetchLatestComic() {
        comic = favoriteComics.last
    }
    
    func favoritesButtonTapped(type: ComicBrowserType) {
        switch type {
        case .remote:
            guard let comic = comic, !isFavorited() else {
                mainDataObject.delete(comic)
                comic = comic
                return }
            mainDataObject.addComicToFavorites(comic, explanation: getExplanationString())
        case .favorite:
            guard let comic = comic else { return }
            mainDataObject.delete(comic)
            fetchFavorites()
        }
        comic = comic
    }
    
    func isFavorited() -> Bool {
        guard let comic = comic else { return false }
        return mainDataObject.hasFavorite(comic: comic)
    }
}

// MARK: Paging
enum Direction {
    case previous
    case next
}

extension MainObservableObject {
    func get(_ direction: Direction) {
        
        let comicId = direction == .previous ? currentComic - 1 : currentComic + 1
        
        guard comicId < latestComic else {
            getLatestComic()
            return
        }
        
        // used to initialize loading animation
        withAnimation {
            comic = nil
        }

        comicService.getComic(withId: comicId)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.update(with: result)
            }
            .store(in: &cancellables)
    }
}

// MARK: HTML Parsing
extension MainObservableObject {
    func getExplanationString() -> String {
        let formattedTitle = comic?.title.split(separator: " ").joined(separator: "_") ?? ""
        let urlTitle = "_" + formattedTitle
        let urlArgument = "\(comic?.num ?? 0):\(urlTitle)"
        
        if let url = URL(string: "https://www.explainxkcd.com/wiki/index.php/\(urlArgument)") {
            do {
                let contents = try String(contentsOf: url)
                do {
                    let doc: Document = try SwiftSoup.parse(contents)
                    for item in try doc.getElementsByClass("mw-parser-output") {
                        let json = try item.getElementsByTag("p")
                        let extractedHTMLString = try json.html()
                        let doc: Document = try SwiftSoup.parse(extractedHTMLString)
                        let extractedString =  try doc.text()
                        return extractedString
                    }
                } catch {
                    print("FAILED TO PARSE HTML")
                    return "Parsing issue. 👎"
                }
            } catch {
                return "It seems this page does not have an explanation. 👎"
            }
        } else {
            return "BAD URL 🙅‍♂️"
        }
        return "It seems there was an error loading the explanation. 🚨"
    }
}


