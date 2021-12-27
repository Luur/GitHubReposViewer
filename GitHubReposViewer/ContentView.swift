//
//  ContentView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        if sessionManager.isUserAuthorized {
            TabBarView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
