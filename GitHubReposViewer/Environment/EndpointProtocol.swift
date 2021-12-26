//
//  EndpointProtocol.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation
import Alamofire

protocol EndpointProtocol {
    
    var baseURL: String { get }
    var path: String { get }
    var requestMethod: RequestMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
    var requestType: RequestType { get }
    
    func query(from parameters: [String: String?]) -> String
}

enum RequestType {
    case unauthorized
    case authorized
}

enum RequestMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    
    func toHTTPMethod() -> HTTPMethod? {
        HTTPMethod(rawValue: self.rawValue)
    }
}

extension EndpointProtocol {
    
    var requestMethod: RequestMethod {
        .get
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var requestType: RequestType {
        .authorized
    }
    
    func query(from parameters: [String: String?]) -> String {
        var components = URLComponents()
        let parameters = parameters.compactMapValues { $0 }
        components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        guard let query = components.query, !query.isEmpty else { return "" }
        return "?" + query
    }
}
