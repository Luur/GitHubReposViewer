//
//  SessionManager.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

class SessionManager: ObservableObject {
    
    @Published var isUserAuthorized: Bool = UserDefaultsConfig.token.value != nil {
        willSet {
            if !newValue {
                UserDefaultsConfig.token.value = nil
            }
        }
    }
}
