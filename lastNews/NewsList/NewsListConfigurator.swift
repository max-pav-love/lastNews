//
//  NewsListConfigurator.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//

import Foundation

final class NewsListConfigurator {
    
    static let shared = NewsListConfigurator()
    
    func setup(with view: NewsListViewController) {
        
        let viewController = view
        let interactor = NewsListInteractor()
        let presenter = NewsListPresenter()
        let router = NewsListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
