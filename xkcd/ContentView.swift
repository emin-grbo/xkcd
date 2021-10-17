import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            ComicBrowser()
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("Comics")
                }
            Favorites()
                .tabItem {
                    Image(systemName: "heart.text.square.fill")
                    Text("Favorites")
                }
        }
        .preferredColorScheme(.dark)
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, ComicBrowserDO.preview.container.viewContext)
    }
}
