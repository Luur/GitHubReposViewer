//
//  LoginView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showingWebAuthenticationSession: Bool = false
    @State private var activeAlert: ActiveAlert?
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome")
                .font(.system(size: 30))
                .foregroundColor(Color("color_dark_gray"))
            GitHubLoginButton {
                showingWebAuthenticationSession = true
            }
        }
        .activityIndicatorView(isAnimating: loginViewModel.isActivityIndicatorAnimating)
        .webAuthenticationSession(isPresented: $showingWebAuthenticationSession) {
            WebAuthenticationSession(url: loginViewModel.authenticationSessionOptions.url, callbackURLScheme: loginViewModel.authenticationSessionOptions.callbackURLScheme) { result in
                switch result {
                case .success(let callbackURL):
                    loginViewModel.validate(callbackURL)
                case .failure(let error):
                    activeAlert = .error(message: error.localizedDescription)
                }
            }
            .prefersEphemeralWebBrowserSession(true)
        }
        .alert(item: $activeAlert) { item in
            switch item {
            case .error(let message):
                return Alert(title: Text(""), message: Text(message), dismissButton: .default(Text("OK")))
            }
        }
    }
}

extension LoginView {
    
    enum ActiveAlert: Identifiable, EnumAssociated {
        case error(message: String)
        var id: String { associated.caseDescription }
    }
}
