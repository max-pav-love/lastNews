//
//  NewsListRouter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

@objc protocol NewsListRoutingLogic {
    func routeToNewsDetail(segue: UIStoryboardSegue?)
}

protocol NewsListDataPassing {
    var dataStore: NewsListDataStore? { get }
}

class NewsListRouter: NSObject, NewsListRoutingLogic, NewsListDataPassing {
    
    weak var viewController: NewsListViewController?
    var dataStore: NewsListDataStore?
    
    // MARK: - Routing Logic
    
    func routeToNewsDetail(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! NewsDetailViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToNewsDetail(source: dataStore!, destination: &destinationDS)
        }
    }
    
    // MARK: - Passing data
    
    func passDataToNewsDetail(source: NewsListDataStore, destination: inout NewsDetailDataStore) {
        guard let indexPath = viewController?.table.indexPathForSelectedRow else { return }
        destination.news = source.news[indexPath.row]
    }
    
}
