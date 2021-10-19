import CoreData
import SwiftUI

class MainDataObject {
    
    static let shared = MainDataObject()
    
    let container: NSPersistentCloudKitContainer
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "xkcd")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: MainDataObject = {
        let result = MainDataObject(inMemory: true)
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
    
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func hasFavorite(comic: Comic) -> Bool {
        let fetchRequest: NSFetchRequest<ComicCD> = ComicCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %d", #keyPath(ComicCD.num), comic.num)
        
        do {
            guard var _ = try container.viewContext.fetch(fetchRequest).first else { return  false}
            return true
        } catch {
            return false
        }
    }
    
    func delete(_ comic: Comic?) {
        guard let comic = comic else { return }
        let fetchRequest: NSFetchRequest<ComicCD> = ComicCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %d", #keyPath(ComicCD.num), comic.num)
        
        do {
            guard let comic = try container.viewContext.fetch(fetchRequest).first else { return }
            print("********** DELETING: \(comic) comics **********")
            container.viewContext.delete(comic)
        } catch {
            return
        }
        save()
    }
    
    func fetchAllFavoriteComics() -> [ComicCD] {
        let fetchRequest: NSFetchRequest<ComicCD> = ComicCD.fetchRequest()
        
        do {
            let comics = try container.viewContext.fetch(fetchRequest)
            print("********** GOT: \(comics.count) comics **********")
            return comics
        } catch {
            return []
        }
    }
    
    func addComicToFavorites(_ comic: Comic, explanation: String) {
        let likedComic = ComicCD(context: container.viewContext)
        likedComic.num = Int32(comic.num)
        likedComic.img = comic.img
        likedComic.favorited = true
        likedComic.title = comic.title
        likedComic.explanation = explanation
        save()
    }
    
}



