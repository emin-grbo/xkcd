import SwiftUI

struct Favorites: View {
    
    @ObservedObject var observable: MainObservableObject
    
    var body: some View {
        ScrollView {
            Text("FAVORITES")
        }
        .onAppear {
            observable.fetchFavorites()
        }
}
}


