//
//  MockRepositoryFetcher.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import Foundation

let mockRepositories: [Item]
    = [Item(id: 1, name: "name1", fullName: "Swift", stargazersCount: 1500, watchersCount: 1500, language: "Swift", forksCount: 200, openIssuesCount: 20),
       Item(id: 2, name: "name2", fullName: "Swift", stargazersCount: 500, watchersCount: 2500, language: "Swift", forksCount: 100, openIssuesCount: 10),
        Item(id: 3, name: "name3", fullName: "Swift", stargazersCount: 400, watchersCount: 500, language: "Swift", forksCount: 250, openIssuesCount: 25),
         Item(id: 4, name: "name4", fullName: "Swift", stargazersCount: 2500, watchersCount: 3500, language: "Swift", forksCount: 130, openIssuesCount: 20),
          Item(id: 5, name: "name5", fullName: "Swift", stargazersCount: 1500, watchersCount: 1500, language: "Swift", forksCount: 200, openIssuesCount: 30),
           Item(id: 6, name: "name6", fullName: "Swift", stargazersCount: 1000, watchersCount: 1000, language: "Swift", forksCount: 150, openIssuesCount: 15),
            Item(id: 7, name: "name7", fullName: "Swift", stargazersCount: 100, watchersCount: 150, language: "Swift", forksCount: 120, openIssuesCount: 19),]

final class MockRepositoryFetchr: RepositoryFetchInterface {
    // メソッドの結果を操作するプロパティ
    var fetchResult: Result<[Item], APIError> = .success(mockRepositories)
    // 呼び出された引数を記録するプロパティ
    var argumentsWord: String?
    // 返り値を記録するプロパティ
    var returnRepositories: [Item]?

    func fetchRepositories(word: String, completion: @escaping (Result<[Item], APIError>) -> Void) {
            completion(fetchResult)
        switch fetchResult {
        case .success:
            returnRepositories = mockRepositories
        default:
            returnRepositories = nil
        }
        self.argumentsWord = word
    }
}

