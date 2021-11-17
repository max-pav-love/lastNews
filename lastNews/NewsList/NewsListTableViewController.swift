//
//  NewsListViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    private var newsArray: [ReadyNews] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setupNavigation(with: newsArray, for: segue)
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSection(for: newsArray)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        prepareCell(for: indexPath, with: newsArray)
    }
    
    // MARK: - Private
    
    private func getNews() {
        NetworkManager.shared.fetchData { news in
            for oneNew in news.data {
                let readyNew = ReadyNews(author: oneNew.author,
                                         text: oneNew.content,
                                         date: oneNew.date,
                                         image: oneNew.imageUrl,
                                         title: oneNew.title,
                                         time: oneNew.time)
                self.newsArray.append(readyNew)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Private UITableViewDataSource Methods
    
    private func numberOfRowsInSection(for news: [ReadyNews] ) -> Int {
        news.count
    }
    
    private func prepareCell(for indexPath: IndexPath, with data: [ReadyNews]) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(data[indexPath.row])
        return cell
    }
    
    private func setupNavigation(with data: [ReadyNews], for segue: UIStoryboardSegue) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let currentRow = data[indexPath.row]
        let detailVC = segue.destination as? NewsDetailViewController
        detailVC?.currentNew = currentRow
    }
    
}

// MARK: - UITableView Extensions

extension NewsListTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
