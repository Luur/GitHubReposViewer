//
//  ActivityIndicatorViewModifier.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct ActivityIndicatorViewModifier: ViewModifier {
    
    var isAnimating: Bool
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            content
                .disabled(isAnimating)
            
            if isAnimating {
                
                ActivityIndicatorView(color: Color("color_dark_gray"))
                    .frame(width: 30, height: 30)
                    .padding(30)
                    .background(BlurViewRepresentation(style: .systemUltraThinMaterial))
                    .cornerRadius(15)
                    .shadow(color: Color("color_gray_shadow"), radius: 8, x: 0, y: 4)
            }
        }
    }
}

extension View {
    func activityIndicatorView(isAnimating: Bool) -> some View {
        self.modifier(ActivityIndicatorViewModifier(isAnimating: isAnimating))
    }
}

