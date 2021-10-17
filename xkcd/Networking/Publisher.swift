import Combine
import Foundation

extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, APIError> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                print("🚨ERROR: \(error.localizedDescription)🚨")
                return .network(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
