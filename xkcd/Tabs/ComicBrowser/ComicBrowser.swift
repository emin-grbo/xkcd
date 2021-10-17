import SwiftUI

struct ComicBrowser: View {
    
    @StateObject private var mainOO = ComicBrowserOO(service: ComicService())
    
    var body: some View {
        VStack {
            Text(mainOO.getNumber())
            Text(mainOO.getTitle())
            
            Spacer()
            
            ComicPage(comic: mainOO.getComic())
            
            Spacer()
            ControlsView()

        }
        .onAppear {
//            mainOO.fetchLatestComic()
//            mainOO.fetch(testCase: .tall)
//            mainOO.fetch(testCase: .wide)
            mainOO.fetch(testCase: .real)
        }
    }
}
