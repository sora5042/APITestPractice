//
//  Repository.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import Foundation

struct Repository: Decodable {
    
    let items: [Item]
}

struct Item: Decodable {
    
    let id: Int?
    let name: String
    let fullName: String
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let forksCount: Int
    let openIssuesCount: Int
}

