//
//  GitHubLoginButton.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct GitHubLoginButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                Image("github_image")
                Text("Log in with GitHub")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 50)
        .background(Color("color_login_button_bg"))
        .cornerRadius(25)
    }
}

struct GitHubLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        GitHubLoginButton(action: {})
    }
}
