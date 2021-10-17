import SwiftUI

enum SFIcon: String {
    case info = "info.circle"
    case favorite = "heart.circle"
    case left = "arrowshape.turn.up.left.circle.fill"
    case right = "arrowshape.turn.up.right.circle.fill"
}

struct SFImage: View {
    let sfIcon: SFIcon
    
    var body: some View {
        Image(systemName: sfIcon.rawValue)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}
