//
//  NewsListTableViewModel.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

import Foundation

class NewsListViewModel: NewsListViewModelProtocol {
    var news: [NewsData] = []
    private var indexPath: IndexPath?
    
    func fetchNews(comletion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { news in
            for oneNew in news.data {
                let readyNew = NewsData(author: oneNew.author,
                                        content: oneNew.content,
                                        date: oneNew.date,
                                        imageUrl: oneNew.imageUrl,
                                        title: oneNew.title)
                self.news.append(readyNew)
            }
            comletion()
        }
    }
    
    func cellViewModel(for indexPath: IndexPath) -> NewsListTableViewCellViewModelProtocol? {
        let news = news[indexPath.row]
        return NewsListTableViewCellViewModel(news: news)
    }
    
    func numberOfRows() -> Int? {
        news.count
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> NewsDetailViewModelProtocol? {
        guard let indexPath = indexPath else {
            return nil
        }
        let news = news[indexPath.row]
        return NewsDetailViewModel(news: news)
    }
    
}
