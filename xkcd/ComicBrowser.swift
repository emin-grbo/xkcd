import SwiftUI

struct ComicBrowser: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.purple)
            Text("ComicBrowser")
                .foregroundColor(Color.white)
        }
    }
}
