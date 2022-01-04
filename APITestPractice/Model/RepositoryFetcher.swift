//
//  RepositoryFetcher.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import Foundation
import Alamofire

protocol RepositoryFetchInterface {
    func fetchRepositories(word: String, completion: @escaping (Result<[Item], APIError>) -> Void)
}

final class RepositoryFetcher: RepositoryFetchInterface {
    
    static let shared = API()
    private let baseUrl = "https://api.github.com"
    
    func fetchRepositories(word: String, completion: @escaping (Result<[Item], APIError>) -> Void) {
        
        let url = baseUrl + "/search/repositories" + "?"
        let params = ["q": "\(word)"]
        let request = AF.request(url, method: .get, parameters: params)
        
        request.responseJSON { (response) in
            
            do {
                let decode = JSONDecoder()
                decode.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = response.data {
                    let value = try decode.decode(Repository.self, from: data)
                }
            } catch {
                print("変換に失敗: ", error)
            }
        }
        
    }
}

