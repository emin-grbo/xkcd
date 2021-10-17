import SwiftUI

struct ControlsView: View {
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "info.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Image(systemName: "heart.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Spacer()
            Image(systemName: "arrowshape.turn.up.left.circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Image(systemName: "arrowshape.turn.up.right.circle.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
        }
        .font(.headline)
        .frame(height: 40)
        .padding(.vertical, 32)
        .padding(.horizontal, 32)
        .foregroundColor(Color.baseAccent)
    }
}
