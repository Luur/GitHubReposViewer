//
//  Pagination.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation

class Pagination {
    
    private var itemsPerPage: Int
    private(set) var currentPage: Int = 1
    private(set) var isNextPageAvailable: Bool = false
    
    init(itemsPerPage: Int) {
        self.itemsPerPage = itemsPerPage
    }
    
    func reset() {
        currentPage = 1
        isNextPageAvailable = false
    }
    
    func pageDownloaded(with itemsCount: Int) {
        currentPage += 1
        isNextPageAvailable = !(itemsCount < itemsPerPage)
    }
}
