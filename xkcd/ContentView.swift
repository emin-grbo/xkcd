//
//  ContentView.swift
//  xkcd
//
//  Created by Emin Grbo on 16/10/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Rectangle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
