import SwiftUI

struct ComicBrowser: View {
    
    @StateObject private var mainOO = ComicBrowserOO(service: ComicService())
    
    var body: some View {
        VStack {
            VStack {
                Text(mainOO.getNumber())
                    .font(.subTitle_18)
                Text(mainOO.getTitle())
                    .font(.title_30)
            }
            .padding(.bottom, 16)
            .frame(width: UIScreen.screenWidth)
            .foregroundColor(Color.baseAccent)
            
            Spacer()
            
            ComicPage(comic: mainOO.getComic())
            
            Spacer()
            ControlsView(observable: mainOO)

        }
        .onAppear {
            if mainOO.comic == nil {
                mainOO.fetchLatestComic()
            }
//            mainOO.fetchLatestComic()
//            mainOO.fetch(testCase: .tall)
//            mainOO.fetch(testCase: .wide)
//            mainOO.fetch(testCase: .real)
        }
    }
}
