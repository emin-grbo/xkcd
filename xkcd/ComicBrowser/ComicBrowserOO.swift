import Combine
import SwiftUI

class ComicBrowserOO: ObservableObject {
    
    // main data obhject
    private var mainDO = ComicBrowserDO()
    
    // published data objects
    @Published var comic: Comic?
    
    #warning("MOCK")
    func fetch() {
        comic = Comic(num: 613,
                        title: "Threesome",
                        img: "https://imgs.xkcd.com/comics/threesome.png")
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
