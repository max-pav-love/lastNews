//
//  NewsListPresenter.swift
//  lastNews
//
//  Created by Максим Хлесткин on 23.11.2021.
//

import Foundation

protocol NewsListPresenterProtocol: AnyObject {
    var news: [NewsData] { get }
    var newsCount: Int? { get }
    func viewDidLoad()
    func news(for indexPath: IndexPath) -> NewsData?
    func showNewsDetails(for indexPath: IndexPath)
}

class NewsListPresenter {
    
    weak var view: NewsListTableViewProtocol?
    var interactor: NewsListInteractorProtocol?
    var router: NewsListRouterProtocol?
    
    var news: [NewsData] = []
    var newsCount: Int? {
        news.count
    }
    
    required init(view: NewsListTableViewProtocol) {
        self.view = view
    }
    
}

extension NewsListPresenter: NewsListPresenterProtocol {
    func viewDidLoad() {
        interactor?.fetchNews()
    }
    
    func news(for indexPath: IndexPath) -> NewsData? {
        if news.indices.contains(indexPath.row) {
            return news[indexPath.row]
        } else {
            return nil
        }
    }
    
    func showNewsDetails(for indexPath: IndexPath) {
        if news.indices.contains(indexPath.row) {
            let currentNew = news[indexPath.row]
            router?.openDetailViewController(with: currentNew)
        }
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    func newsDidReceive(_ news: [NewsData]) {
        self.news = news
        view?.reloadData()
    }
}
