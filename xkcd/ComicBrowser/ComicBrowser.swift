import SwiftUI

struct ComicBrowser: View {
    
    @StateObject private var mainOO = ComicBrowserOO()
    
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
            mainOO.fetch()
        }
    }
}
