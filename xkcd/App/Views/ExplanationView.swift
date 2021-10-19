import SwiftUI

struct ExplanationView: View {
    
    @ObservedObject var observable: MainObservableObject
    @State var explanationString = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Explanation")
                    .font(.title_30)
                    .padding(.top, 40)
                Text(explanationString)
                    .font(.subTitle_16)
                    .lineSpacing(8)
            }
            .padding(.horizontal, 32)
        }
        .onAppear {
            explanationString = observable.getExplanationString()
        }
        .background(Color.baseDark)
    }
}
