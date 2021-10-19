import SwiftUI

struct PlaceHolderView : View {
    
    @State var isLoading = false
    
    var body : some View {
        ZStack {
            Circle()
                .stroke(Color(.gray).opacity(0.5), lineWidth: 14)
                .frame(width: 100, height: 100)
                .blur(radius: 5)
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.white, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.easeInOut.speed(0.8).repeatForever(autoreverses: true), value: isLoading)
                .onAppear() {
                    self.isLoading = true
                }
        }
        .padding()
    }
}

