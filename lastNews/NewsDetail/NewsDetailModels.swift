//
//  NewsDetailModels.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

enum NewsDetail {
    enum ShowDetail {
        struct Request {
        }
        struct Response {
            let news: NewsData
        }
        struct ViewModel {
            
            struct DisplayedDetail{
                let detailNewsName: String?
                let detailNewsContent: String?
                let detailNewsAuthor: String?
                let detailNewsDate: String?
                let detailNewsImageUrl: String?
            }
            let dispalayedDetail: DisplayedDetail
        }
    }
}
