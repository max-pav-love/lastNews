//
//  NewsListModels.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

enum NewsList {
    enum FetchNews {
        struct Request {
        }
        struct Response {
            var news: [NewsData]
        }
        struct ViewModel {
            
            struct DisplayedNews {
                var newsName: String?
                var newsDate: String?
                var newsImageUrl: URL?
            }
            var displayedNews: [DisplayedNews]
        }
    }
}
