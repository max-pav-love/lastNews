//
//  NewsDetailPresenter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NewsDetailPresentationLogic {
    func presentDetails(response: NewsDetail.ShowDetail.Response)
}

class NewsDetailPresenter: NewsDetailPresentationLogic {
    weak var viewController: NewsDetailDisplayLogic?
    
    // MARK: - PresentationLogic
    
    func presentDetails(response: NewsDetail.ShowDetail.Response) {
        let displayedDetails = NewsDetail
            .ShowDetail
            .ViewModel
            .DisplayedDetail(detailNewsName: response.news.title,
                             detailNewsContent: response.news.content,
                             detailNewsAuthor: response.news.author,
                             detailNewsDate: response.news.date,
                             detailNewsImageUrl: response.news.imageUrl)
        let viewModel = NewsDetail.ShowDetail.ViewModel(dispalayedDetail: displayedDetails)
        viewController?.displayDetail(viewModel: viewModel)
    }
    
}
