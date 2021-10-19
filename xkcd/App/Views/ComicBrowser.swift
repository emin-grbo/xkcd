import SwiftUI

struct ComicBrowser: View {
    
    @ObservedObject var observable: MainObservableObject
    @State private var isActivityPresented = false
    
    let browserType: ComicBrowserType
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(observable.getNumber())
                        .font(.subTitle_18)
                    Text(observable.getTitle())
                        .font(.title_30)
                }
                .padding(.leading, 24)
                Spacer()
                SFImage(.share, prefferedSize: 16)
                    .onTapGesture {
                        isActivityPresented.toggle()
                    }
                    .padding(.trailing, 24)
            }
            .padding(.bottom, 16)
            .frame(width: UIScreen.screenWidth)
            .foregroundColor(.white)
            Spacer()
            ComicPage(comic: observable.getComic())
            Spacer()
            ControlsView(observable: observable, browserType: browserType)
        }
        .background(Color.baseDark)
        .background(
            ShareSheet(
                isPresented: $isActivityPresented,
                data: [observable.comic?.imgUrl ?? ""]
            )
        )
    }
}

enum ComicBrowserType {
    case remote
    case favorite
}
