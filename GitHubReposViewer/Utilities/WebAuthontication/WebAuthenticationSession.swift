//
//  WebAuthenticationSession.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI
import AuthenticationServices

struct WebAuthenticationSession {
    
    let url: URL
    let callbackURLScheme: String?
    let completionHandler: ASWebAuthenticationSession.CompletionHandler
    
    var prefersEphemeralWebBrowserSession: Bool = false
    
    init(url: URL, callbackURLScheme: String?, completion: @escaping (_ result: Result<URL, Error>) -> Void) {
        self.url = url
        self.callbackURLScheme = callbackURLScheme
        self.completionHandler = { callbackURL, error in
            if let callbackURL = callbackURL {
                completion(.success(callbackURL))
            } else if let error = error {
                completion(.failure(error))
            } else {
                assertionFailure("Both callbackURL and error are nil.")
            }
        }
    }
    
    func prefersEphemeralWebBrowserSession(_ prefersEphemeralWebBrowserSession: Bool) -> Self {
        var modified = self
        modified.prefersEphemeralWebBrowserSession = prefersEphemeralWebBrowserSession
        return modified
    }
    
    func applyModification(to webAuthenticationSession: ASWebAuthenticationSession) {
        webAuthenticationSession.prefersEphemeralWebBrowserSession = self.prefersEphemeralWebBrowserSession
    }
}

struct WebAuthenticationSessionOptions {
    private let urlString: String = "https://github.com/login/oauth/authorize?client_id=62758d29b4686b0f0b93"
    var url: URL? { URL(string: urlString) }
    let callbackURLScheme: String = "auth"
    let prefersEphemeralWebBrowserSession: Bool = true
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

