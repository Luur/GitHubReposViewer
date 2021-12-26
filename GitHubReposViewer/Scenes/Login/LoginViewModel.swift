//
//  LoginViewModel.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

class LoginViewModel: ObservableObject {

    private let authServiceProvider: AuthServiceProvider
    private let environment: Environment
    
    @Published var activeAlert: LoginView.ActiveAlert?
    @Published var isActivityIndicatorAnimating: Bool = false

    init(authServiceProvider: AuthServiceProvider = AuthServiceProvider(), environment: Environment = .current) {
        self.authServiceProvider = authServiceProvider
        self.environment = environment
    }
    
    var authenticationSessionOptions: (url: URL, callbackURLScheme: String) {
        let endpoint: AuthEndpoint = .authorize(clientID: environment.clientID)
        let url = URL(string: endpoint.baseURL + endpoint.path)!
        return (url, environment.callbackURLScheme)
    }
    
    func validate(_ callbackURL: URL) {
        let components = URLComponents(string: callbackURL.absoluteString)
        let code = components?.queryItems?.first(where: { $0.name == "code" })?.value
        if let code = code {
            getAccessToken(code: code)
        } else {
            activeAlert = .error(message: LoginError.invalidCallbackURL.localizedDescription)
        }
    }

    func getAccessToken(code: String) {
        print(code)
        isActivityIndicatorAnimating = true
    }
}
