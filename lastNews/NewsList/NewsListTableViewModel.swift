//
//  NewsListTableViewModel.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

import Foundation

class NewsListViewModel: NewsListViewModelProtocol {
    
    var newsArray: [NewsData] = []
    private var indexPath: IndexPath?
    
    func fetchNews(comletion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { news in
            self.newsArray = news.data
            comletion()
        }
    }
    
    func cellViewModel(for indexPath: IndexPath) -> NewsListTableViewCellViewModelProtocol? {
        let news = newsArray[indexPath.row]
        return NewsListTableViewCellViewModel(news: news)
    }
    
    func numberOfRows() -> Int? {
        newsArray.count
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> NewsDetailViewModelProtocol? {
        guard let indexPath = indexPath else {
            return nil
        }
        let news = newsArray[indexPath.row]
        return NewsDetailViewModel(news: news)
    }
}
