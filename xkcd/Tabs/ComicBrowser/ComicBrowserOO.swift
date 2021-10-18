import Combine
import SwiftUI

class ComicBrowserOO: ObservableObject {
    
    // main data obhject
    var mainDO: ComicBrowserDO = ComicBrowserDO()
    
    // published data objects
    @Published var comic: Comic?
    
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
}

// MARK: Networking
extension ComicBrowserOO {

    func update(with data: Comic) {
        comic = data
        currentComic = data.num
    }
    
    func fetchLatestComic() {
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
    
    func fetchComic(withID id: Int) {
        comicService.fetchComic(withId: id)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.update(with: result)
            }
            .store(in: &cancellables)
    }
}

// MARK: Paging
enum Direction {
    case previous
    case next
}

extension ComicBrowserOO {
    func fetch(_ direction: Direction) {
        
        let comicId = direction == .previous ? currentComic - 1 : currentComic + 1
        
        guard comicId < latestComic else {
            fetchLatestComic()
            return
        }
        
        withAnimation {
            comic = nil
        }

        comicService.fetchComic(withId: comicId)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.update(with: result)
            }
            .store(in: &cancellables)
    }
}


