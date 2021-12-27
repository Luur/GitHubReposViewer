//
//  HistoryDataStorage.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

protocol HistoryDataStorageProtocol: AnyObject {
    var repositories: [Repository] { get }
    func add(_ repository: Repository)
}

class HistoryDataStorage: HistoryDataStorageProtocol {
    static var shared = HistoryDataStorage()
    private init() { }
    
    var repositories: [Repository] = []
    
    func add(_ repository: Repository) {
        if let index = repositories.firstIndex(where: { $0.id == repository.id }) {
            _ = repositories.remove(at: index)
        }
        repositories.insert(repository, at: 0)
        if repositories.count > 20 {
            repositories.removeLast()
        }
    }
}
