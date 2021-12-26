//
//  ActivityIndicatorView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 26.12.2021.
//

import SwiftUI

struct ActivityIndicatorView: View {

    let color: Color

    @State private var rotation: Double = 0

    var body: some View {
        
        let gradientColors = Gradient(colors: [Color.white.opacity(0), color])
        let conic = AngularGradient(gradient: gradientColors, center: .center, startAngle: .zero, endAngle: .degrees(360))
        let lineWidth: CGFloat = 4

        let animation = Animation
            .linear(duration: 1.0)
            .repeatForever(autoreverses: false)

        return Circle()
                .trim(from: lineWidth / 500, to: 1 - lineWidth / 100)
                .stroke(conic, style: StrokeStyle(lineWidth: lineWidth, lineCap: .butt))
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    rotation = 0
                    withAnimation(animation) { rotation = 360 }
                }
    }
}
