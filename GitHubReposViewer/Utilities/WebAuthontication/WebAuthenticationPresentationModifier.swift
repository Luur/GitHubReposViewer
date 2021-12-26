//
//  WebAuthenticationPresentationModifier.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct WebAuthenticationPresentationModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    var representationBuilder: () -> WebAuthenticationSession
    
    private var item: Binding<Bool?> {
        .init(
            get: { self.isPresented ? true : nil },
            set: { self.isPresented = ($0 != nil) }
        )
    }
    
    private func itemRepresentationBuilder(bool: Bool) -> WebAuthenticationSession {
        return representationBuilder()
    }
    
    func body(content: Content) -> some View {
        content.background(
            WebAuthenticationPresenter(item: item, representationBuilder: itemRepresentationBuilder)
        )
    }
}

extension Bool: Identifiable {
    public var id: Bool { self }
}

extension View {
    func webAuthenticationSession(isPresented: Binding<Bool>, content representationBuilder: @escaping () -> WebAuthenticationSession) -> some View {
        self.modifier(
            WebAuthenticationPresentationModifier(isPresented: isPresented, representationBuilder: representationBuilder)
        )
    }
}
