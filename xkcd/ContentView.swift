import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            ComicBrowser()
                .tabItem {
                    Image(systemName: "circle")
                }
            Favorites()
                .tabItem {
                    Image(systemName: "circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
