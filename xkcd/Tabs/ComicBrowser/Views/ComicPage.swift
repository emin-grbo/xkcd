import SwiftUI

struct ComicPage: View {
    
    var comic: Comic
    @State private var zoomedOut = true
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                AsyncImage(url: comic.imgUrl) { image in
                    withAnimation(.easeInOut) {
                    image
                        .resizable()
                        .animation(.easeInOut, value: 10)
                        .aspectRatio(contentMode: zoomedOut ? .fit : .fill)
                        .if(zoomedOut) { $0.scaledToFit() }
                        
                    }
                } placeholder: {
                    PlaceHolderView()
                }
                .frame(width: zoomedOut ? UIScreen.screenWidth : nil)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        zoomedOut.toggle()
                    }
                }
            }
            .frame(width: UIScreen.screenWidth)
        }
    }
}

//    .gesture(DragGesture()
//                .onChanged { value in
//        if zoomedOut {
//            if value.location.x < value.startLocation.x {
//                mainOO.fetch(previous: false)
//                print(value)
//            } else {
//                mainOO.fetch(previous: true)
//                print(value)
//            }
//        }
//    })
