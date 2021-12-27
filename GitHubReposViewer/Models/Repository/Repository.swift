//
//  Repository.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

struct Repository: Decodable, Identifiable {
    let id: Int
    let fullName: String
    let description: String?
    let starsCount: Int
    let htmlURL: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case starsCount = "stargazers_count"
        case id
        case description
        case htmlURL = "html_url"
    }
}
