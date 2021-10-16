import SwiftUI

struct Favorites: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.pink)
            Text("Favorites")
                .foregroundColor(Color.white)
        }
    }
}
