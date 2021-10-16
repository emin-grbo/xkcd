import SwiftUI

struct ComicBrowser: View {
    
    let testComic = Comic(num: 614,
                          title: "Woodpecker",
                          alt: "If you don't have an extension cord I can get that too.  Because we're friends!  Right?",
                          img: "https://imgs.xkcd.com/comics/woodpecker.png")
    
    var body: some View {
        ZStack {
            AsyncImage(url: testComic.imgUrl) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
            } placeholder: {
                Color.red
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray)
            )
            .padding()
        }
    }
}
