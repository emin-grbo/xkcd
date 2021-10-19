import SwiftUI

struct ControlsView: View {
    
    @ObservedObject var observable: MainObservableObject
    @State var isShowingExplanation = false
    @State var showSearch = false
    let browserType: ComicBrowserType
    
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
                observable.favoritesButtonTapped(type: browserType)
            } label: {
                SFImage(.favorite)
                    .animation(.spring(), value: observable.isFavorited())
                    .foregroundColor(observable.isFavorited() ? .red : .white)
            }

            Spacer()
            
            Button {
                showSearch.toggle()
                print("TappedFav")
            } label: {
                SFImage(.search)
            }.opacity(observable.hasSearch(type: browserType) ? 1 : 0)
            
            Spacer()
            
            Button {
                print("TappedLeft")
                observable.get(.previous, type: browserType)
            } label: {
                SFImage(.left)
            }
            
            Button {
                print("TappedRight")
                observable.get(.next, type: browserType)
            } label: {
                SFImage(.right)
            }
        }
        .frame(height: 40)
        .font(.headline)
        .padding(.vertical, 32)
        .padding(.horizontal, 32)
        .foregroundColor(.white)
        .buttonStyle(AnimatedTapButtonStyle())
        
        .sheet(isPresented: $isShowingExplanation) {
            ExplanationView(observable: observable)
        }
        .sheet(isPresented: $showSearch) {
            SearchPickerView(observable: observable)
        }
    }
}
