import Combine
import SwiftUI

class ComicBrowserOO: ObservableObject {
    
    private let comicService: ComicService
    private var cancellables = Set<AnyCancellable>()
    
    // main data obhject
    private var mainDO = ComicBrowserDO()
    
    // published data objects
    @Published var comic: Comic?
    
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
        return comic?.title ?? "No Comic Loaded"
    }
    
    func getImageUrl() -> URL? {
        return comic?.imgUrl
    }
}

// MARK: Networking
extension ComicBrowserOO {
    
    // ------------------------------------------------------------------
#warning("MOCK data - remove")
    enum TestCases {
        case wide
        case tall
        case real
    }
    
    func fetch(testCase: TestCases) {
        switch testCase {
        case .wide:
            comic = Comic(num: 613,
                          title: "Threesome",
                          img: "https://imgs.xkcd.com/comics/threesome.png")
        case .tall:
            comic = Comic(num: 614,
                          title: "Woodpecker",
                          img: "https://imgs.xkcd.com/comics/woodpecker.png")
        case .real:
            fetchLatestComic()
        }
    }
    // ------------------------------------------------------------------
    
    func fetchLatestComic() {
        comicService.fetchLatestComic()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.comic = result
            }
            .store(in: &cancellables)
    }
    
    func fetchComic(with id: Int) {
        comicService.fetchComic(withId: id)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.comic = result
            }
            .store(in: &cancellables)
    }
}



