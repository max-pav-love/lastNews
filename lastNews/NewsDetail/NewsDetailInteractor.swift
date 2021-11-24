//
//  NewsDetailInteractor.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NewsDetailBusinessLogic {
    func showDetail(request: NewsDetail.ShowDetail.Request)
}

protocol NewsDetailDataStore {
    var news: NewsData? { get set }
}

class NewsDetailInteractor: NewsDetailBusinessLogic, NewsDetailDataStore {
    
    var presenter: NewsDetailPresentationLogic?
    var worker: NewsDetailWorker?
    var news: NewsData?
    
    // MARK: - Business Logic
    
    func showDetail(request: NewsDetail.ShowDetail.Request) {
        worker = NewsDetailWorker()
        worker?.doSomeWork()
        
        let response = NewsDetail.ShowDetail.Response(news: news!)
        presenter?.presentDetails(response: response)
    }
    
}
