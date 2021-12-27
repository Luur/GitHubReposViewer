//
//  RepositoriesView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import SwiftUI

struct RepositoriesView: View {
    
    @SwiftUI.Environment(\.openURL) var openURL
    @StateObject var repositoriesViewModel = RepositoriesViewModel()
    
    var body: some View {
        List {
            ForEach(repositoriesViewModel.repositories) { repo in
                RepositoriesListRow(repository: repo)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        openURL(URL(string: repo.htmlURL)!)
                    }
                    .onAppear {
                        repositoriesViewModel.fetchMoreRepositoriesIfNeeded(itemID: repo.id)
                    }
            }
            if repositoriesViewModel.isNextPageAvailable {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        }
        .listStyle(.plain)
        .alert(item: $repositoriesViewModel.activeAlert) { item in
            switch item {
            case .error(let message):
                return Alert(title: Text(""), message: Text(message), dismissButton: .default(Text("OK")))
            }
        }
        .searchable(text: $repositoriesViewModel.searchText)
    }
}

extension LoginView {
    
    enum RepositoriesView: Identifiable, EnumAssociated {
        case error(message: String)
        var id: String { associated.caseDescription }
    }
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesView()
    }
}
