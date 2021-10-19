import SwiftUI

struct TextProminentButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
                .font(.buttonTitle_20)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .frame(height: 48))
        }
        .padding(40)
        .scaleEffect(configuration.isPressed ? 0.92 : 1.0)
    }
}
