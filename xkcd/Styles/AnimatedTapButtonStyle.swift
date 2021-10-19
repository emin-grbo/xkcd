import SwiftUI

struct AnimatedTapButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
}
