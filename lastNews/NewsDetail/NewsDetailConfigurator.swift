//
//  NewsDetailConfigurator.swift
//  lastNews
//
//  Created by Максим Хлесткин on 22.11.2021.
//

import Foundation

protocol NewsDetailConfiguratorProtocol: AnyObject {
    func configure(with view: NewsDetailViewController, and news: NewsData)
}

class NewsDetailConfigurator: NewsDetailConfiguratorProtocol {
    func configure(with view: NewsDetailViewController, and news: NewsData) {
        let presenter = NewsDetailPresenter(view: view)
        let interactor = NewsDetailInteractor(presenter: presenter, news: news)
        view.presenter = presenter
        presenter.interactor = interactor 
    }
    
}
