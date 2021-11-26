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
    var newsArray: [NewsData] { get }
}

class NewsListInteractor: NewsListBusinessLogic, NewsListDataStore {    
    
    var presenter: NewsListPresentationLogic?
    var newsArray: [NewsData] = []
    private let networkManager = NetworkManager()
    
    // MARK: - Business Logic
    
    func fetchNews(request: NewsList.FetchNews.Request) {
        networkManager.fetchData { [weak self] news in
            self?.newsArray = news.data
            let response = NewsList.FetchNews.Response(news: self?.newsArray ?? [])
            self?.presenter?.presentNews(response: response)
        }
    }
}
