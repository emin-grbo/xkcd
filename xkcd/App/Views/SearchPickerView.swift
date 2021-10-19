import SwiftUI

struct SearchPickerView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var observable: MainObservableObject
    @State private var selection = "1"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Search Comic by #")
                .font(.title_30)
                .padding(.top, 40)
                .padding(.bottom, 24)
            
            SearchTextfield(textFieldLabel: "Comic number", selection: $selection)
            
            // Pickerview with generated comic numbers
            Picker(selection: $selection, label: Text("Comic Selection")) {
                ForEach(observable.comicNumbers(), id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal, 40)
            
            Spacer()
            
            Button("GO") {
                observable.getComic(withID: Int(selection) ?? 1)
                dismiss()
            }
            .buttonStyle(TextProminentButtonStyle())
            
        }
        .onAppear {
            selection = "\(observable.currentComic)"
        }
        .background(Color.baseDark)
    }
}
