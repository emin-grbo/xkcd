import SwiftUI

struct ComicBrowser: View {
    
    @ObservedObject var observable: MainObservableObject
    let browserType: ComicBrowserType
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(observable.getNumber())
                        .font(.subTitle_18)
                    Text(observable.getTitle())
                        .font(.title_30)
                }
            }
            .padding(.bottom, 16)
            .frame(width: UIScreen.screenWidth)
            .foregroundColor(Color.baseAccent)
            Spacer()
            ComicPage(comic: observable.getComic())
            Spacer()
            ControlsView(observable: observable, browserType: browserType)
        }
    }
}

enum ComicBrowserType {
    case remote
    case favorite
}
