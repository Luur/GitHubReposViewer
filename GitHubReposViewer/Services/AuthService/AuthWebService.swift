//
//  AuthWebService.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation
import Combine

class AuthWebService: AuthServiceProtocol {
    
    private let router: Router<AuthEndpoint>
    private let environment: Environment
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(router: Router<AuthEndpoint> = .current, environment: Environment = .current) {
        self.router = router
        self.environment = environment
    }
    
    func getAccessToken(code: String) -> AnyPublisher<String, Error> {
        Future<String, Error> { [unowned self] promise in
            router.request(.accessToken(clientID: environment.clientID, clientSecret: environment.clientSecret, code: code))
                .tryMap { (result: AccessTokenResponse) -> String in
                    result.token
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
