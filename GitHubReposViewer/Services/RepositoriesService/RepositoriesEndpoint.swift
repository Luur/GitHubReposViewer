//
//  RepositoriesEndpoint.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

enum RepositoriesEndpoint {
    case repositories(searchText: String, page: Int)
}

extension RepositoriesEndpoint: EndpointProtocol {
    
    var baseURL: String {
        "https://api.github.com/"
    }
    
    var path: String {
        switch self {
        case .repositories(let searchText, let page):
            let path = "search/repositories"
            return path + query(from: ["q": searchText, "page": String(page), "per_page": "10", "sort": "stars"])
        }
    }
    
    var requestType: RequestType {
        return .unauthorized
    }
}
