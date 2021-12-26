//
//  EnumAssociated.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import Foundation

protocol EnumAssociated {}

extension EnumAssociated {
    var associated: (caseDescription: String, associatedValue: Any?) {
        let mirror = Mirror(reflecting: self)
        guard let associated = mirror.children.first else { return ("\(self)", nil)}
        return (associated.label!, associated.value)
    }
}
