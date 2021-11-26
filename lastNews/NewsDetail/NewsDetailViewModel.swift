//
//  NewsDetailViewModel.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

import Foundation

class NewsDetailViewModel: NewsDetailViewModelProtocol {
    
    private var news: NewsData
    
    var newsDetailImageUrl: URL? {
        return news.imageUrl
    }
    var newsDetailText: String? {
        return news.content
    }
    var newsDetailAuthor: String? {
        return news.author
    }
    var newsDetailDate: String? {
        return news.date
    }
    var newsDetailTitle: String? {
        return news.title
    }
        
    required init(news: NewsData) {
        self.news = news
    }

}
