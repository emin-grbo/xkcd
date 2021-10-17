import SwiftUI

struct ControlsView: View {
    
    @ObservedObject var observable: ComicBrowserOO
    
    var body: some View {
        HStack(spacing: 24) {
            
            Button {
                print("TappedInfo")
            } label: {
                SFImage(sfIcon: .info)
            }
            
            
            Button {
                print("TappedFav")
            } label: {
                SFImage(sfIcon: .favorite)
            }
            .buttonStyle(AnimatedTapButtonStyle())

            Spacer()
            
            Button {
                print("TappedLeft")
                observable.fetch(.previous)
            } label: {
                SFImage(sfIcon: .left)
            }
            .buttonStyle(AnimatedTapButtonStyle())
            
            Button {
                print("TappedRight")
                observable.fetch(.next)
            } label: {
                SFImage(sfIcon: .right)
            }
            .buttonStyle(AnimatedTapButtonStyle())
        }
        .font(.headline)
        .frame(height: 40)
        .padding(.vertical, 32)
        .padding(.horizontal, 32)
        .foregroundColor(Color.baseAccent)
        .buttonStyle(AnimatedTapButtonStyle())
    }
}

struct AnimatedTapButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
}
