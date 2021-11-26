//
//  NewsListInteractor.swift
//  lastNews
//
//  Created by Максим Хлесткин on 23.11.2021.
//

import Foundation

protocol NewsListInteractorProtocol: AnyObject {
    func fetchNews()
}

protocol NewsListInteractorOutputProtocol: AnyObject {
    func newsDidReceive(_ news: [NewsData])
}

class NewsListInteractor {
    
    weak var presenter: NewsListInteractorOutputProtocol?
    private let networkManager = NetworkManager()
    required init(presenter: NewsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}

extension NewsListInteractor: NewsListInteractorProtocol {
    func fetchNews() {
        networkManager.fetchData { [weak self] news in
            self?.presenter?.newsDidReceive(news.data)
        }
    }
}
