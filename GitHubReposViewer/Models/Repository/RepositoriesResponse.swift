//
//  RepositoriesResponse.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

struct RepositoriesResponse: Decodable {
    let items: [Repository]
    let totalCount: Int
    let incompleteResults: Bool
    
    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case totalCount = "total_count"
        case items
    }
}
