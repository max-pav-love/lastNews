//
//  NewsDetailPresenter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 22.11.2021.
//

import Foundation

protocol NewsDetailPresenterProtocol: AnyObject {
    func showDetails()
}

struct NewsDetailData {
    let newsName: String?
    let newsText: String?
    let newsAuthor: String?
    let newsDate: String?
    let newsImage: String?
}

class NewsDetailPresenter {
    weak var view: NewsDetailViewProtocol?
    var interactor: NewsDetailInteractorProtocol?
    
    required init(view: NewsDetailViewProtocol) {
        self.view = view
    }
    
}

extension NewsDetailPresenter: NewsDetailPresenterProtocol {
    func showDetails() {
        interactor?.provideNewsDetail()
    }
    
}

extension NewsDetailPresenter: NewsDetailInteractorOutputProtocol {
    func receiveNewsDetail(newsDetailData: NewsDetailData) {
        view?.setNewsDetailName(with: newsDetailData.newsName)
        view?.setNewsDetailText(with: newsDetailData.newsText)
        view?.setNewsDetailAuthor(with: newsDetailData.newsAuthor)
        view?.setNewsDetailDate(with: newsDetailData.newsDate)
        view?.setNewsDetailImage(with: newsDetailData.newsImage ?? "")
    }
    
}
