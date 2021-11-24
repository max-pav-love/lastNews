//
//  NewsDetailRouter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

@objc protocol NewsDetailRoutingLogic {
    
}

protocol NewsDetailDataPassing {
    var dataStore: NewsDetailDataStore? { get }
}

class NewsDetailRouter: NSObject, NewsDetailRoutingLogic, NewsDetailDataPassing {
    weak var viewController: NewsDetailViewController?
    var dataStore: NewsDetailDataStore?
    
}
