//
//  NewsListViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit

protocol NewsListTableViewProtocol: AnyObject {
    func reloadData()
}

class NewsListTableViewController: UITableViewController {
    
    @IBOutlet private weak var table: UITableView?
    
    var presenter: NewsListPresenterProtocol?
    private let configurator: NewsListConfiguratorProtocol = NewsListConfigurator()
    let detailSegue = "showDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        prepareCell(for: indexPath)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigation(by: segue, with: sender)
    }
    
    // MARK: - Private
    
    private func prepareCell(for indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = table?.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier) as? NewsListTableViewCell,
            let news = presenter?.news(for: indexPath)
        else {
            return UITableViewCell()
        }
        cell.configure(news)
        return cell
    }
    
    private func numberOfRows() -> Int {
        presenter?.newsCount ?? 0
    }
    
    private func navigation(by segue: UIStoryboardSegue, with sender: Any?) {
        if segue.identifier == detailSegue {
            guard let news = sender as? NewsData else { return }
            let detailVC = segue.destination as! NewsDetailViewController
            let configurator: NewsDetailConfiguratorProtocol = NewsDetailConfigurator()
            configurator.configure(with: detailVC, and: news)
        }
    }
    
}

// MARK: - UITableView Extensions

extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showNewsDetails(for: indexPath)
    }
}

extension NewsListTableViewController: NewsListTableViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
