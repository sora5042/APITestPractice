//
//  RepositoryViewModel.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import Foundation

final class RepositoryViewModel: ObservableObject {
    
    var repositories: Item?
    var apiError: APIError?
    
    
    // 疎結合
    private let repositoryFetchInterface: RepositoryFetchInterface
    init(fetchRepository: RepositoryFetchInterface) {
        self.repositoryFetchInterface = fetchRepository
    }

    func searchRepository(word: String) {
        repositoryFetchInterface.fetchRepositories(word: word) { (result) in
            switch result {
            case .success(let success):
                print("success", success)
                
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
