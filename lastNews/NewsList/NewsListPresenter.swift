//
//  NewsListPresenter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NewsListPresentationLogic {
    func presentNews(response: NewsList.FetchNews.Response)
}

class NewsListPresenter: NewsListPresentationLogic {
    
    weak var viewController: NewsListDisplayLogic?
    var worker: NewsListWorker?
    
    // MARK: - PresentationLogic
    
    func presentNews(response: NewsList.FetchNews.Response) {
        worker = NewsListWorker()
        guard let displayedNews = worker?.getDisplayedNews(from: response.news) else { return }
        let viewModel = NewsList.FetchNews.ViewModel(displayedNews: displayedNews)
        viewController?.displayNews(viewModel: viewModel)
    }
}
