import Combine

protocol ComicServiceProtocol {
    func fetchLatestComic() -> AnyPublisher<Comic, APIError>
    func getComic(withId: Int) -> AnyPublisher<Comic, APIError>
}
