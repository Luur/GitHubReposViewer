//
//  HistoryView.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import SwiftUI

struct HistoryView: View {
    
    @SwiftUI.Environment(\.openURL) var openURL
    private let historyDataStorage: HistoryDataStorageProtocol
    @State private var repositories: [Repository] = []
    
    init(historyDataStorage: HistoryDataStorageProtocol = HistoryDataStorage.shared) {
        self.historyDataStorage = historyDataStorage
    }
    
    var body: some View {
        
        List(repositories) { repo in
            RepositoriesListRow(repository: repo)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    openURL(URL(string: repo.htmlURL)!)
                }
        }
        .listStyle(.plain)
        .emptyDataView(condition: repositories.isEmpty) {
            Text("Currentrly there are no repositories.")
        }
        .onAppear {
            repositories = historyDataStorage.repositories
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
