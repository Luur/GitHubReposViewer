//
//  AuthServiceProvider.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation
import Combine

protocol AuthServiceProtocol {
    func getAccessToken(code: String) -> AnyPublisher<String, Error>
}

class AuthServiceProvider: ServiceProviderProtocol {
    
    private let environment: Environment
    
    init(environment: Environment = .current) {
        self.environment = environment
    }
    
    func service() -> AuthServiceProtocol {
        switch environment {
        case .sandbox:
            return AuthMockService()
        case .development:
            return AuthWebService()
        }
    }
}
