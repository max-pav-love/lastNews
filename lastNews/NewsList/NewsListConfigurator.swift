//
//  NewsListConfigurator.swift
//  lastNews
//
//  Created by Максим Хлесткин on 23.11.2021.
//

import Foundation

protocol NewsListConfiguratorProtocol {
    func configure(with viewController: NewsListTableViewController)
}

class NewsListConfigurator: NewsListConfiguratorProtocol {
    func configure(with viewController: NewsListTableViewController) {
        let presenter = NewsListPresenter(view: viewController)
        let interactor = NewsListInteractor(presenter: presenter)
        let router = NewsListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
