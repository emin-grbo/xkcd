import Combine
import Foundation

class ComicService: ComicServiceProtocol, ObservableObject {
    private let urlSession =  URLSession.shared
    private let decoder = JSONDecoder()
    
    func fetchLatestComic() -> AnyPublisher<Comic, APIError> {
        guard let url = Endpoints.latest.url else {
            return Fail(error: APIError.badURL).eraseToAnyPublisher()
        }
        return urlSession.publisher(for: url)
    }
    
    func fetchComic(withId id: Int) -> AnyPublisher<Comic, APIError> {
        guard let url = Endpoints.withId(comicID: id).url else {
            return Fail(error: APIError.badURL).eraseToAnyPublisher()
        }
        return urlSession.publisher(for: url)
    }
}

private extension ComicService {
    enum Endpoints {
        case latest
        case withId(comicID: Int)
        
        var url: URL? {
            switch self {
            case .latest:
                return makeURL()
            case .withId(let comicID):
                return makeURL(comicId: "\(comicID)/")
            }
        }
        
        private func makeURL(comicId: String = "") -> URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "xkcd.com"
            components.path = comicId + "/info.0.json"
            
            return components.url
        }
    }
}
