//
//  APIError.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import Foundation
import UIKit

enum APIError: Error {
    case searchWordEmpty
    case invalidURL
    case networkError
    case unknown
    
    var title: String {
        switch self {
        case .networkError:
            return "ネットワークエラー"
        case .unknown:
            return "不明なエラー"
        default:
            return "検索エラー"
        }
    }
    
    var description: String {
        switch self {
        case .searchWordEmpty:
            return "検索ワードを入力してください。"
        case .invalidURL:
            return "別の検索ワードを試してください。検索ワードには半角英数字のみお使いいただけます。"
        case .networkError:
            return "接続環境の良いところでもう一度お試しください。"
        case .unknown:
            return "不明なエラーです。"
        }
    }
    
    func showAlert(from: UIViewController) {
        UIAlertController.showAPIErrorAlert(error: self, from)
    }
}

