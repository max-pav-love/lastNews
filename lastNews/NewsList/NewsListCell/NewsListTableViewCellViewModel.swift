//
//  NewsListTableViewCellViewModel.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

import Foundation

class NewsListTableViewCellViewModel: NewsListTableViewCellViewModelProtocol {
    
    private var news: NewsData
    
    var title: String {
        return news.title
    }
    var author: String {
        return news.author
    }
    var date: String {
        return news.date
    }
    var imageData: URL? {
        return news.imageUrl
    }
    
    required init(news: NewsData) {
        self.news = news
    }
}
