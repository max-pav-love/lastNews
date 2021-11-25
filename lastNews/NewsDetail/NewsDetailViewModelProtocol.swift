//
//  NewsDetailViewModelProtocol.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

protocol NewsDetailViewModelProtocol {
    var newsDetailTitle: String? { get }
    var newsDetailText: String? { get }
    var newsDetailAuthor: String? { get }
    var newsDetailDate: String? { get }
    var newsDetailImage: String? { get }
    
    init (news: NewsData)
}
