//
//  GitHubReposViewerApp.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

@main
struct GitHubReposViewerApp: App {
    
    @StateObject var sessionManager: SessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sessionManager)
        }
    }
}
