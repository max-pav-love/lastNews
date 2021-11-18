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
    
    var viewModel: NewsListTableViewCellViewModelProtocol! {
        didSet {
            newsTitleLabel?.text = viewModel.title
            newsDetailLabel?.text = viewModel.date
            ImageManager.shared.getImage(url: viewModel.imageData, image: newsImage)
        }
    }
    
}
