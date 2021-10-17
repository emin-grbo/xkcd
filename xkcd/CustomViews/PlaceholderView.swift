import SwiftUI

struct PlaceHolderView : View {
    
    @State var show = false
    
    var body : some View {
        Rectangle()
            .fill(
                RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.black]),
                               center: .center,
                               startRadius: 16,
                               endRadius: show ? 18 : 32)
            )
            .onAppear {
                withAnimation(Animation.easeInOut.speed(0.5).repeatForever(autoreverses: true)){
                    self.show.toggle()
                }
            }
    }
}
