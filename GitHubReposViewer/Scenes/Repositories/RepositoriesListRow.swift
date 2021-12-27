//
//  RepositoriesListRow.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import SwiftUI

struct RepositoriesListRow: View {
    
    let repository: Repository
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(repository.fullName)
                    .font(Font.title)
                
                repository.description.map {
                    Text($0)
                        .font(Font.body)
                }
                
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text(String(repository.starsCount))
                        .font(Font.body)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(color: Color("color_gray_shadow"), radius: 8, x: 0, y: 4)
        )
        .contentShape(Rectangle())
    }
}
