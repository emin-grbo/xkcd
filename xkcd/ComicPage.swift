import SwiftUI

struct ComicPage: View {
    
    var comic: Comic
    @State private var zoomedIn = true
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(Axis.Set.horizontal, showsIndicators: true) {
                AsyncImage(url: comic.imgUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: zoomedIn ? .fit : .fill)
                        .if(zoomedIn) { $0.scaledToFit() }
                } placeholder: {
                    Color.red
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray)
                )
                .onTapGesture {
                    zoomedIn.toggle()
                }
            }
            .frame(width: UIScreen.screenWidth)
        }
    }
}
