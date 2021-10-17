import SwiftUI

struct ComicPage: View {
    
    var comic: Comic
    @State private var zoomedIn = true
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(Axis.Set.horizontal, showsIndicators: true) {
                AsyncImage(url: comic.imgUrl) { image in
                    withAnimation(.easeInOut) {
                    image
                        .resizable()
                        .animation(.easeInOut, value: 10)
                        .aspectRatio(contentMode: zoomedIn ? .fit : .fill)
                        .if(zoomedIn) { $0.scaledToFit() }
                    }
                } placeholder: {
                    PlaceHolderView()
                }
                .frame(width: zoomedIn ? UIScreen.screenWidth : nil)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        zoomedIn.toggle()
                    }
                }
            }
            .frame(width: UIScreen.screenWidth)
        }
    }
}
