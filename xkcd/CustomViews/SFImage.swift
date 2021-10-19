import SwiftUI

enum SFIcon: String {
    case info = "info.circle"
    case favorite = "heart.circle"
    case left = "arrowshape.turn.up.left.circle.fill"
    case right = "arrowshape.turn.up.right.circle.fill"
    case search = "magnifyingglass.circle.fill"
    case newsPaper = "newspaper.fill"
}

struct SFImage: View {
    let sfIcon: SFIcon
    let prefferedSize: CGFloat
    
    init(_ sfIcon: SFIcon, prefferedSize: CGFloat = 40) {
        self.sfIcon = sfIcon
        self.prefferedSize = prefferedSize
    }
    
    var body: some View {
        Image(systemName: sfIcon.rawValue)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(height: prefferedSize)
    }
}
