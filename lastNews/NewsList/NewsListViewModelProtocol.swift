//
//  NewsListViewModelProtocol.swift
//  lastNews
//
//  Created by Максим Хлесткин on 18.11.2021.
//

import Foundation

protocol NewsListViewModelProtocol {
    var news: [NewsData] { get }
    func fetchNews(comletion: @escaping() -> Void )
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> NewsListTableViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> NewsDetailViewModelProtocol?
}
