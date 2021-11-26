//
//  NewsListViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NewsListDisplayLogic: AnyObject {
    func displayNews(viewModel: NewsList.FetchNews.ViewModel)
}

class NewsListViewController: UITableViewController {
    
    @IBOutlet weak var table: UITableView?
    private var newsArray: [NewsList.FetchNews.ViewModel.DisplayedNews] = []
    
    var interactor: NewsListBusinessLogic?
    var router: (NSObjectProtocol & NewsListRoutingLogic & NewsListDataPassing)?
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router,
               router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsListConfigurator.shared.setup(with: self)
        getNews()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table?.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(newsArray[indexPath.row])
        return cell
    }
    
    private func getNews() {
        let request = NewsList.FetchNews.Request()
        interactor?.fetchNews(request: request)
    }
    
}

// MARK: - Methods

extension NewsListViewController: NewsListDisplayLogic {
    func displayNews(viewModel: NewsList.FetchNews.ViewModel) {
        newsArray = viewModel.displayedNews
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension NewsListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
