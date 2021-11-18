//
//  NewsListTableViewCellViewModelProtocol.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

protocol NewsListTableViewCellViewModelProtocol {
    var title: String { get }
    var author: String { get }
    var date: String { get }
    var imageData: String { get }
    
    init(news: NewsData)
}
