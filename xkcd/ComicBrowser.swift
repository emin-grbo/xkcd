import SwiftUI

struct ComicBrowser: View {
    
    

    let testComic = Comic(num: 614,
                          title: "Woodpecker",
                          alt: "If you don't have an extension cord I can get that too.  Because we're friends!  Right?",
                          img: "https://imgs.xkcd.com/comics/woodpecker.png")
    
    var body: some View {
        VStack {
            Text(testComic.title)
            
            Spacer()
            
            ComicPage(comic: testComic)
            
            Spacer()
            
            Text(testComic.title)
            Text(testComic.alt)
        }
    }
}
