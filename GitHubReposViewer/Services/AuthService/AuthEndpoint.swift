//
//  AuthEndpoint.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

enum AuthEndpoint {
    case authorize(clientID: String)
    case accessToken(clientID: String, clientSecret: String, code: String)
}

extension AuthEndpoint: EndpointProtocol {
    
    var baseURL: String {
        "https://github.com/login/oauth/"
    }
    
    var path: String {
        switch self {
        case .authorize(let clientID):
            let path = "authorize"
            return path + query(from: ["client_id": clientID])
        case .accessToken(_, _, _):
            return "access_token"
        }
    }
    
    var requestMethod: RequestMethod {
        switch self {
        case .authorize(_):
            return .get
        case .accessToken(_, _, _):
            return .post
        }
    }
    
    var requestType: RequestType {
        return .unauthorized
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .authorize(_):
            return nil
        case .accessToken(let clientID, let clientSecret, let code):
            return ["client_id": clientID, "client_secret": clientSecret, "code": code]
        }
    }
}
