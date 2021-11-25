//
//  NewsListWorker.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class NewsListWorker {
    func getDisplayedNews(from news: [NewsData]) -> [NewsList
                                                        .FetchNews
                                                        .ViewModel
                                                        .DisplayedNews] {
        var displayedNews: [NewsList
                                .FetchNews
                                .ViewModel
                                .DisplayedNews] = []
        news.forEach { news in
            let newsName = news.title
            let newsDate = news.date
            let newsImageUrl = news.imageUrl
            let oneDisplayedNews = NewsList
                .FetchNews
                .ViewModel
                .DisplayedNews(newsName: newsName,
                               newsDate: newsDate,
                               newsImageUrl: newsImageUrl)
            displayedNews.append(oneDisplayedNews)
        }
        return displayedNews
    }
    
}
