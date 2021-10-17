import CoreData
import SwiftUI

class ComicBrowserDO {
    
    static let shared = ComicBrowserDO()
    
    let container: NSPersistentCloudKitContainer
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "logostretch")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: ComicBrowserDO = {
        let result = ComicBrowserDO(inMemory: true)
        let viewContext = result.container.viewContext
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    func createSampleData() -> [Comic] {
        return [
            Comic(num: 613,
                  title: "Threesome",
                  img: "https://imgs.xkcd.com/comics/threesome.png"),
            Comic(num: 614,
                  title: "Woodpecker",
                  img: "https://imgs.xkcd.com/comics/woodpecker.png"),
            Comic(num: 615,
                  title: "Avoidance",
                  img: "https://imgs.xkcd.com/comics/avoidance.png")
        ]
    }
    
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
}
