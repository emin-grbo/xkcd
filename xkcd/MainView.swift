import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var observable = MainObservableObject(service: ComicService())
    
    var body: some View {
        TabView {
            
            //MARK: ComicBrowser Tab -------------------------------
            ComicBrowser(observable: observable, browserType: .remote)
            .onAppear {
                if observable.currentComic == 0 {
                    observable.getLatestComic()
                } else {
                    observable.getComic(withID: observable.currentComic)
                }
            }
            .tabItem {
                Image(systemName: "text.book.closed.fill")
                Text("Comics")
            }
            
            //MARK: Favorites Tab -------------------------------
            ComicBrowser(observable: observable, browserType: .favorite)
                .onAppear(perform: {
                    observable.fetchFavorites()
                })
                .tabItem {
                    Image(systemName: "heart.text.square.fill")
                    Text("Favorites")
                }
        }
        .preferredColorScheme(.dark)
        .accentColor(.white)
    }
}
