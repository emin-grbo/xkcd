import SwiftUI

@main
struct xkcdApp: App {
    let persistenceController = ComicBrowserDO.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
