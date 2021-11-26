//
//  NewsModel.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import Foundation

struct News: Codable {
    let data: [NewsData]
}

struct NewsData: Codable {
    let author: String
    let content: String
    let date: String
    let imageUrl: URL?
    let title: String
}
