//
//  AuthMockService.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation
import Combine

class AuthMockService: AuthServiceProtocol {
    
    // MARK: - Data
    
    static let token = "gho_16C7e42F292c6912E7710c838347Ae178B4a"
    
    // MARK: - Methods
    
    func getAccessToken(code: String) -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
                promise(.success(type(of: self).token))
            }
        }
        .eraseToAnyPublisher()
    }
}
