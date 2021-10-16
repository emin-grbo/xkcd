//
//  xkcdApp.swift
//  xkcd
//
//  Created by Emin Grbo on 16/10/2021.
//

import SwiftUI

@main
struct xkcdApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
