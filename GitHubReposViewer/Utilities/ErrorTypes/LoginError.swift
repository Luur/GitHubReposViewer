//
//  LoginError.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

enum LoginError: Error {
    case invalidCallbackURL
}

extension LoginError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidCallbackURL:
            return "Provided callback URL is invalid."
        }
    }
}
