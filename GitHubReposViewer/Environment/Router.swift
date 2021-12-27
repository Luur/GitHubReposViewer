//
//  Router.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation
import Combine

protocol RouterProtocol: AnyObject {
    associatedtype Endpoint: EndpointProtocol
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error>
}

class Router<Endpoint: EndpointProtocol>: RouterProtocol {
    
    private let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    static var current: Router {
        Router(environment: Environment.current)
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error> {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            //.receive(on: DispatchQueue.main)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.requestMethod.rawValue
        for header in endpoint.headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        if let params = endpoint.parameters {
            if let data = try? JSONSerialization.data(withJSONObject: params, options: []) {
                request.httpBody = data
            }
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension Router {
    
//    private func authorizationHeaders() -> [String: String] {
//        guard let token = token else { return  [:] }
//        return ["Authorization": "token \(token)"]
//    }
    
//    private var token : String? {
//        get { UserDefaultsConfig.token.value }
//        set { UserDefaultsConfig.token.value = newValue }
//    }
    
//    private func httpHeaders(endpoint: Endpoint) -> HTTPHeaders {
//        var headers = endpoint.headers
//        if endpoint.requestType == .authorized {
//            headers = endpoint.headers.merging(authorizationHeaders()) { $1 }
//        }
//        return HTTPHeaders(headers)
//    }
}
