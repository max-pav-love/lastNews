//
//  NewsModel.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import Foundation

struct News: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let author: String
    let content: String
    let date: String
    let imageUrl: String
    let time: String
    let title: String
}

struct ReadyNews {
    let author: String
    let text: String
    let date: String
    let image: String
    let title: String
    let time: String
}
