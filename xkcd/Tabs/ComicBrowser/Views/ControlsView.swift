import SwiftUI

struct ControlsView: View {
    
    @ObservedObject var observable: ComicBrowserOO
    @State var isShowingExplanation = false
    @State var showSearch = false
    
    var body: some View {
        HStack(spacing: 24) {
            
            Button {
                print("TappedInfo")
                isShowingExplanation.toggle()
            } label: {
                SFImage(.info)
            }
            
            Button {
                print("TappedFav")
            } label: {
                SFImage(.favorite)
            }

            Spacer()
            
            Button {
                showSearch.toggle()
                print("TappedFav")
            } label: {
                SFImage(.search)
            }
            
            Spacer()
            
            Button {
                print("TappedLeft")
                observable.fetch(.previous)
            } label: {
                SFImage(.left)
            }
            
            Button {
                print("TappedRight")
                observable.fetch(.next)
            } label: {
                SFImage(.right)
            }
        }
        .font(.headline)
        .padding(.vertical, 32)
        .padding(.horizontal, 32)
        .foregroundColor(Color.baseAccent)
        .buttonStyle(AnimatedTapButtonStyle())
        .sheet(isPresented: $isShowingExplanation) {
            ExplanationView(observable: observable)
        }
        .sheet(isPresented: $showSearch) {
            SearchPickerView(observable: observable)
        }
    }
}
