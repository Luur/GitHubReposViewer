//
//  AccessTokenResponse.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

struct AccessTokenResponse: Codable {
    let token: String
    let scope: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case tokenType = "token_type"
        case scope
    }
}
