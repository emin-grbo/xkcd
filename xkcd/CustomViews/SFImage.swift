import SwiftUI

enum SFIcon: String {
    case info = "doc.plaintext.fill"
    case favorite = "heart.square.fill"
    case left = "arrowtriangle.left.square.fill"
    case right = "arrowtriangle.right.square.fill"
    case search = "doc.text.fill.viewfinder"
    case newsPaper = "newspaper.fill"
    case share = "square.and.arrow.up"
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
