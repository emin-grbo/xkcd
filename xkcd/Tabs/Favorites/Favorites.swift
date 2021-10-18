import SwiftUI
import SwiftSoup

struct Favorites: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.pink)
            Text("Favorites")
                .foregroundColor(Color.white)
        }
//        .onAppear {
//            if let url = URL(string: "https://www.explainxkcd.com/wiki/index.php/1297:_Oort_Cloud") {
//                do {
//                    let contents = try String(contentsOf: url)
//                    print(contents)
//                    do {
//                        let doc: Document = try SwiftSoup.parse(contents)
//                        for item in try doc.getElementsByClass("mw-parser-output") {
//                            let json = try item.getElementsByTag("p").first()
//                            print(json)
////                            htmlString = json
//                        }
//                    } catch Exception.Error(let type, let message) {
//                        print(message)
//                    } catch {
//                        print("error")
//                    }
//                } catch {
//                    // contents could not be loaded
//                }
//            } else {
//                // the URL was bad!
//            }
//        }
    }
}
