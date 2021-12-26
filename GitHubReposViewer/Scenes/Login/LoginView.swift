//
//  LoginView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showingWebAuthenticationSession: Bool = false
    @State private var webAuthenticationSessionCallbackURL: URL? = nil
    @State private var webAuthenticationSessionOptions = WebAuthenticationSessionOptions()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome")
                .font(.system(size: 30))
            GitHubLoginButton {
                showingWebAuthenticationSession = true
            }
        }
        .webAuthenticationSession(isPresented: $showingWebAuthenticationSession) {
            WebAuthenticationSession(url: webAuthenticationSessionOptions.url!, callbackURLScheme: webAuthenticationSessionOptions.callbackURLScheme) { result in
                switch result {
                case .success(let callbackURL):
                    print(callbackURL)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .prefersEphemeralWebBrowserSession(webAuthenticationSessionOptions.prefersEphemeralWebBrowserSession)
        }
    }
}
