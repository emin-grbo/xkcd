import SwiftUI

struct ControlsView: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            Image(systemName: "info.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Image(systemName: "heart.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Image(systemName: "arrowshape.turn.up.left.circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Image(systemName: "arrowshape.turn.up.right.circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
        }
        .frame(height: 60)
        
        .foregroundColor(Color.blue)
    }
}
