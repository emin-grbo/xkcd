import Foundation

enum APIError: Error {
  case network(description: String)
  case parsing(description: String)
  case badURL
}
