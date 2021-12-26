//
//  Environment.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

enum Environment: String {
    case sandbox
    case development
    
    static var current: Environment {
        .development
    }
    
    var clientID: String {
        "62758d29b4686b0f0b93"
    }
    
    var clientSecret: String {
        "19f410dd10dc63cefee6ea7ba9464eacc0e0b463"
    }
    
    var callbackURLScheme: String {
        "auth"
    }
}
