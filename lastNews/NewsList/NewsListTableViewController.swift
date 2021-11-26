//
//  NewsListViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var newsArray: [NewsData] = []
    private let networkManager = NetworkManager()
    
    @IBOutlet private weak var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setupNavigation(with: newsArray, for: segue)
    }
    
    // MARK: - UITableViewDataSource
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSection(for: newsArray)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        prepareCell(for: indexPath, with: newsArray)
    }
    
    // MARK: - Private
    
    private func numberOfRowsInSection(for news: [NewsData] ) -> Int {
        news.count
    }
    
    private func prepareCell(for indexPath: IndexPath, with data: [NewsData]) -> UITableViewCell {
        guard let cell = table?.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data[indexPath.row])
        return cell
    }
    
    private func setupNavigation(with data: [NewsData], for segue: UIStoryboardSegue) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let currentRow = data[indexPath.row]
        let detailVC = segue.destination as? NewsDetailViewController
        detailVC?.currentNew = currentRow
    }
    
    private func getNews() {
        networkManager.fetchData { [weak self] news in
            self?.newsArray = news.data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - UITableView Extensions

extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
