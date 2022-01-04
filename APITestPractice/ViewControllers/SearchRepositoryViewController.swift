//
//  ViewController.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import UIKit

class SearchRepositoryViewController: UIViewController {

    private let cellId = "cellId"
    var repositoryItems = [Item]()
    var repositoryItem: Item?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchRepositoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        searchRepositoryTableView.delegate = self
        searchRepositoryTableView.dataSource = self
        searchBar.delegate = self
        
        searchRepositoryTableView.register(UINib(nibName: "SearchRepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    // API処理メソッド
    func fetchSearchRepositoryInfo(word: String) {
        let path = "/search/repositories"
        
        API.shared.request(word: word, path: path, type: Repository.self) { [weak self] (repository) in
            self?.repositoryItems = repository.items
            self?.searchRepositoryTableView.reloadData()
        }
    }
}

extension SearchRepositoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = searchRepositoryTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchRepositoryTableViewCell {
            cell.repositoryItem = repositoryItems[indexPath.row]
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
}

extension SearchRepositoryViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // seachBarのtextを空にする
        searchBar.text = ""
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        guard let word = searchBar.text else { return }
        fetchSearchRepositoryInfo(word: word)
    }
    
}
