import SwiftUI

struct ComicBrowser: View {
    
    @StateObject private var observable = ComicBrowserOO(service: ComicService())
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(observable.getNumber())
                        .font(.subTitle_18)
                    Text(observable.getTitle())
                        .font(.title_30)
                }
            }
            .padding(.bottom, 16)
            .frame(width: UIScreen.screenWidth)
            .foregroundColor(Color.baseAccent)
            
            Spacer()
            
            ComicPage(comic: observable.getComic())
            
            Spacer()
            ControlsView(observable: observable)
        }
        .onAppear {
            if observable.currentComic == 0 {
                observable.fetchLatestComic()
            } else {
                observable.fetchComic(withID: observable.currentComic)
            }
        }
    }
}
