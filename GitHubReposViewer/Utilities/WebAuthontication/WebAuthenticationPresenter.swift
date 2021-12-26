//
//  WebAuthenticationPresenter.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI
import AuthenticationServices

struct WebAuthenticationPresenter<Item: Identifiable>: UIViewRepresentable {
    
    @Binding var item: Item?
    var representationBuilder: (Item) -> WebAuthenticationSession
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        return context.coordinator.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.parent = self
        context.coordinator.item = item
    }
}

extension WebAuthenticationPresenter {
    
    class Coordinator: NSObject {
        
        var parent: WebAuthenticationPresenter
        
        init(parent: WebAuthenticationPresenter) {
            self.parent = parent
        }
        
        let view = UIView()
        private weak var session: ASWebAuthenticationSession?
        
        var item: Item? {
            didSet(oldItem) {
                handleItemChange(from: oldItem, to: item)
            }
        }
        
        private func handleItemChange(from oldItem: Item?, to newItem: Item?) {
            switch (oldItem, newItem) {
            case (.none, .none):
                ()
            case let (.none, .some(newItem)):
                startWebAuthenticationSession(with: newItem)
            case (.some, .some):
                ()
            case (.some, .none):
                cancelWebAuthenticationSession()
            }
        }
        
        private func startWebAuthenticationSession(with item: Item) {
            let representation = parent.representationBuilder(item)
            let session = ASWebAuthenticationSession(url: representation.url, callbackURLScheme: representation.callbackURLScheme, completionHandler: { (callbackURL, error) in
                    self.resetItemBinding()
                    representation.completionHandler(callbackURL, error)
                }
            )
            session.presentationContextProvider = presentationContextProvider
            representation.applyModification(to: session)
            session.start()
            self.session = session
        }
        
        private func cancelWebAuthenticationSession() {
            session?.cancel()
        }
        
        private func resetItemBinding() {
            parent.item = nil
        }
        
        private lazy var presentationContextProvider = PresentationContextProvider(coordinator: self)
        
        class PresentationContextProvider: NSObject, ASWebAuthenticationPresentationContextProviding {
            
            unowned var coordinator: WebAuthenticationPresenter.Coordinator
            
            init(coordinator: WebAuthenticationPresenter.Coordinator) {
                self.coordinator = coordinator
            }
            
            func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
                return coordinator.view.window!
            }
        }
    }
}
