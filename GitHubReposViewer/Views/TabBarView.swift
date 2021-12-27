//
//  TabBarView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import SwiftUI

struct TabBarView: View {
     
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTabIndex) {
            
            NavigationView {
                RepositoriesView()
                    .navigationBarTitle("Repositories")
            }
            .tabItem {
                Label("Repositories", systemImage: "list.dash")
            }
            .tag(0)
            
            NavigationView {
                HistoryView()
                    .navigationBarTitle("History")
            }
            .tabItem {
                Label("History", systemImage: "book.fill")
            }
            .tag(1)
            
            NavigationView {
                ProfileView()
                    .navigationBarTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(2)
        }
        .accentColor(Color("color_dark_gray"))
    }
}
