//
//  RepositoriesViewModel.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation
import Combine

class RepositoriesViewModel: ObservableObject {
    
    private let repositoriesServiceProvider: RepositoriesServiceProvider
    private let pagination: Pagination
    private let historyDataStorage: HistoryDataStorageProtocol
    
    @Published var activeAlert: LoginView.ActiveAlert?
    @Published var searchText: String = ""
    @Published var repositories: [Repository] = []
    private var subscriptions = Set<AnyCancellable>()
    
    private var searchTextPublisher:  AnyPublisher<String, Never> {
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    init(repositoriesServiceProvider: RepositoriesServiceProvider = RepositoriesServiceProvider(), pagination: Pagination = Pagination(itemsPerPage: 10), historyDataStorage: HistoryDataStorageProtocol = HistoryDataStorage.shared) {
        self.repositoriesServiceProvider = repositoriesServiceProvider
        self.pagination = pagination
        self.historyDataStorage = historyDataStorage
        searchTextPublisher
            .flatMap { (text) -> AnyPublisher<[Repository], Error> in
                repositoriesServiceProvider.service().fetchRepositories(searchText: text, page: 1)
            }
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.activeAlert = .error(message: error.localizedDescription)
                }
            }) { repositories in
                self.pagination.reset()
                self.pagination.pageDownloaded(with: repositories.count)
                self.repositories = repositories
            }
            .store(in: &subscriptions)
    }
    
    func fetchMoreRepositoriesIfNeeded(itemID: Int) {
        let lastItemID = repositories.last?.id
        guard lastItemID == itemID else { return }
        guard pagination.isNextPageAvailable else { return }
        repositoriesServiceProvider.service().fetchRepositories(searchText: searchText, page: pagination.currentPage)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.activeAlert = .error(message: error.localizedDescription)
                }
            }) { repositories in
                self.pagination.pageDownloaded(with: repositories.count)
                self.repositories.append(contentsOf: repositories)
            }
            .store(in: &subscriptions)
    }
    
    func markAsViewed(_ repository: Repository) {
        historyDataStorage.add(repository)
    }
    
    var isNextPageAvailable: Bool {
        pagination.isNextPageAvailable
    }
}
