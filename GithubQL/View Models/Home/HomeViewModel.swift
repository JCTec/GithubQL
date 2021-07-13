//
//  HomeViewModel.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import SwiftUI

// MARK: - HomeViewModel
class HomeViewModel: ObservableObject {
    @Published var repositories: [RepositoryParts] = [RepositoryParts]()
    @Published var isLoading: Bool = true
    var cursor: Cursor = Cursor()
    
    /// Loads Repositories with current `Cursor`.
    func loadRepositories() {
        Network.shared.client.fetch(query: SearchQuery(afterCursor: cursor.encoded()), queue: DispatchQueue.global(qos: .background)) { result in
            guard let data = try? result.get().data else {
                return
            }
            
            guard let repo = data.search.repo else {
                return
            }
            
            let repositories = repo.map({ $0?.repo?.fragments.repositoryParts }).compactMap { $0 }
            
            DispatchQueue.main.async {
                self.repositories.append(contentsOf: repositories)
                self.isLoading = false
            }
        }
    }
    
    /// Advances `Cursor` one more step and triggers loading.
    func loadMoreContent() {
        isLoading = true
        cursor.next()
        loadRepositories()
    }
}
