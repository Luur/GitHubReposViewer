//
//  ServiceProviderProtocol.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

protocol ServiceProviderProtocol {
    associatedtype ServiceProtocol
    func service() -> ServiceProtocol
}
