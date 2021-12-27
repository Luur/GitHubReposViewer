//
//  RepositoriesWebService.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation
import Combine

class RepositoriesWebService: RepositoriesServiceProtocol {
    
    private let router: Router<RepositoriesEndpoint>
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(router: Router<RepositoriesEndpoint> = .current) {
        self.router = router
    }
    
    func fetchRepositories(searchText: String, page: Int) -> AnyPublisher<[Repository], Error> {
        Future<[Repository], Error> { [unowned self] promise in
            router.request(.repositories(searchText: searchText))
                .tryMap { (result: RepositoriesResponse) -> [Repository] in
                    result.items
                }
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        promise(.failure(error))
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.subscriptions)
        }
        .eraseToAnyPublisher()
    }
}
