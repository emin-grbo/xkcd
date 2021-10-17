import SwiftUI

struct PlaceHolderView : View {
    
    @State var show = false
    
    var body : some View{
        Rectangle()
            .fill(
                LinearGradient(colors: [Color.clear , Color.white.opacity(0.48), Color.clear],
                               startPoint: show ? .topLeading : .topTrailing ,
                               endPoint: show ? .bottomTrailing : .bottomLeading )
            )
            .onAppear {
                withAnimation(Animation.easeInOut.speed(0.5).repeatForever()){
                    self.show.toggle()
                }
            }
    }
}
