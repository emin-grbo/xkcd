import Combine

protocol ComicServiceProtocol {
    func fetchLatestComic() -> AnyPublisher<Comic, APIError>
    func fetchComic(withId: Int) -> AnyPublisher<Comic, APIError>
}
