//
//  NewsListRouter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 23.11.2021.
//

import Foundation

protocol NewsListRouterProtocol: AnyObject {
    func openDetailViewController(with news: NewsData)
}

class NewsListRouter {
    
    weak var viewController: NewsListTableViewController?
    
    init(viewController: NewsListTableViewController) {
        self.viewController = viewController
    }
}

extension NewsListRouter: NewsListRouterProtocol {
    func openDetailViewController(with news: NewsData) {
        viewController?.performSegue(withIdentifier: viewController?.detailSegue ?? "", sender: news)
    }
}
