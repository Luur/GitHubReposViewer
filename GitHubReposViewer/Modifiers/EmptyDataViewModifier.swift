//
//  EmptyDataViewModifier.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import SwiftUI

struct EmptyDataViewModifier<Presenting, T>: View where Presenting: View, T: View {
    let presenting: () -> Presenting
    let emptyDataView: () -> T
    var condition: Bool
    
    var body: some View {
        ZStack {
            if condition {
                emptyDataView()
            } else {
               presenting()
            }
        }
    }
}

extension View {
    func emptyDataView<T>(condition: Bool, emptyDataView: @escaping () -> T) -> some View where T: View {
        EmptyDataViewModifier(presenting: { self }, emptyDataView: emptyDataView, condition: condition)
    }
}
