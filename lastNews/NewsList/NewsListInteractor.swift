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
    
    required init(presenter: NewsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}

extension NewsListInteractor: NewsListInteractorProtocol {
    func fetchNews() {
        var newsArray = [NewsData]()
        NetworkManager.shared.fetchData { [weak self] news in
            for oneNew in news.data {
                let readyNew = NewsData(author: oneNew.author,
                                        content: oneNew.content,
                                        date: oneNew.date,
                                        imageUrl: oneNew.imageUrl,
                                        title: oneNew.title)
                newsArray.append(readyNew)
            }
            self?.presenter?.newsDidReceive(newsArray)
        }
    }
}
