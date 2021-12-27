//
//  RepositoriesServiceProvider.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation
import Combine

protocol RepositoriesServiceProtocol {
    func fetchRepositories(searchText: String, page: Int) -> AnyPublisher<[Repository], Error>
}

class RepositoriesServiceProvider: ServiceProviderProtocol {
    
    private let environment: Environment
    
    init(environment: Environment = .current) {
        self.environment = environment
    }
    
    func service() -> RepositoriesServiceProtocol {
        switch environment {
        case .sandbox:
            return RepositoriesMockService()
        case .development:
            return RepositoriesWebService()
        }
    }
}
