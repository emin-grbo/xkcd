import Foundation

struct Comic: Codable, Identifiable {
    
    let num: Int
    let title: String
    let img: String

    // Id is needed if used within a list
    var id: Int {
      return num
    }
    
    var imgUrl: URL? {
        return URL(string: img)
    }
}

// other model properties which are not needed for the MVP
//let alt: String
//let day: String
//let month: String
//let year: String
//let link: String
//let news: String
//let safeTitle: String
//let transcript: String
