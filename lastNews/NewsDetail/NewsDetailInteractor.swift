//
//  NewsDetailInteractor.swift
//  lastNews
//
//  Created by Максим Хлесткин on 22.11.2021.
//

import Foundation

protocol NewsDetailInteractorProtocol: AnyObject {
    func provideNewsDetail()
}

protocol NewsDetailInteractorOutputProtocol: AnyObject {
    func receiveNewsDetail(newsDetailData: NewsDetailData)
}

class NewsDetailInteractor {
    
    weak var presenter: NewsDetailInteractorOutputProtocol!
    private var news: NewsData
    
    init(presenter: NewsDetailInteractorOutputProtocol, news: NewsData) {
        self.presenter = presenter
        self.news = news
    }
    
}

extension NewsDetailInteractor: NewsDetailInteractorProtocol {
    func provideNewsDetail() {
        let newsDetailData = NewsDetailData(newsName: news.title,
                                            newsText: news.content,
                                            newsAuthor: news.author,
                                            newsDate: news.date,
                                            newsImage: news.imageUrl)
        presenter.receiveNewsDetail(newsDetailData: newsDetailData)
    }
}
