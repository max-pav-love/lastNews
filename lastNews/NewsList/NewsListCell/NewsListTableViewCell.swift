//
//  NewsListTableViewCell.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var newsTitleLabel: UILabel?
    @IBOutlet private weak var newsDetailLabel: UILabel?
    @IBOutlet private weak var newsImage: UIImageView?
    
    static let identifier = "NewsListTableViewCell"
    
    func configure(_ news: NewsList.FetchNews.ViewModel.DisplayedNews) {
        newsTitleLabel?.text = news.newsName
        newsDetailLabel?.text = news.newsDate
        newsImage?.kf.indicatorType = .activity
        newsImage?.kf.setImage(with: news.newsImageUrl)
    }
    
}
