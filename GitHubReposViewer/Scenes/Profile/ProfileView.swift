//
//  ProfileView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        Button(action: logout) {
            Text("Log out")
                .foregroundColor(.white)
                .padding(.horizontal, 30)
        }
        .frame(height: 50)
        .background(Color("color_dark_gray"))
        .cornerRadius(25)
    }
}

extension ProfileView {
    
    func logout() {
        sessionManager.isUserAuthorized = false
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
