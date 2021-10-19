import SwiftUI

@main
struct xkcdApp: App {
    let persistenceController = MainDataObject.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
