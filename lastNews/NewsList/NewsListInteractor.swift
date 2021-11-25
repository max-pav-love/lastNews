//
//  NewsListInteractor.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NewsListBusinessLogic {
    func fetchNews(request: NewsList.FetchNews.Request)
}

protocol NewsListDataStore {
    var news: [NewsData] { get }
}

class NewsListInteractor: NewsListBusinessLogic, NewsListDataStore {
    
    var presenter: NewsListPresentationLogic?
    var news: [NewsData] = []
    
    // MARK: - Business Logic
    
    func fetchNews(request: NewsList.FetchNews.Request) {
        NetworkManager.shared.fetchData { news in
            for oneNew in news.data {
                let readyNew = NewsData(author: oneNew.author,
                                        content: oneNew.content,
                                        date: oneNew.date,
                                        imageUrl: oneNew.imageUrl,
                                        title: oneNew.title)
                self.news.append(readyNew)
                let response = NewsList.FetchNews.Response(news: self.news)
                self.presenter?.presentNews(response: response)
            }
        }
    }
    
}
