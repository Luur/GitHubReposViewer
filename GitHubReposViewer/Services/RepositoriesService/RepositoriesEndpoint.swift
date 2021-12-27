//
//  RepositoriesEndpoint.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

enum RepositoriesEndpoint {
    case repositories(searchText: String)
}

extension RepositoriesEndpoint: EndpointProtocol {
    
    var baseURL: String {
        "https://api.github.com/"
    }
    
    var path: String {
        switch self {
        case .repositories(let searchText):
            let path = "search/repositories"
            return path + query(from: ["q": searchText])
        }
    }
    
    var requestType: RequestType {
        return .unauthorized
    }
}
