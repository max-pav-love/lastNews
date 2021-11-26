//
//  NewsDetailViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit
import Kingfisher

protocol NewsDetailViewProtocol: AnyObject {
    func setNewsDetailName(with name: String?)
    func setNewsDetailText(with text: String?)
    func setNewsDetailAuthor(with author: String?)
    func setNewsDetailDate(with date: String?)
    func setNewsDetailImage(with url: URL?)
}

class NewsDetailViewController: UIViewController {
    
    @IBOutlet private weak var detailTitle: UILabel?
    @IBOutlet private weak var detailImage: UIImageView?
    @IBOutlet private weak var detailAuthor: UILabel?
    @IBOutlet private weak var detailDate: UILabel?
    @IBOutlet private weak var detailText: UITextView?
    
    var presenter: NewsDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.showDetails()
    }
    
}

extension NewsDetailViewController: NewsDetailViewProtocol {
    func setNewsDetailText(with text: String?) {
        detailText?.text = text
    }
    
    func setNewsDetailAuthor(with author: String?) {
        detailAuthor?.text = author
    }
    
    func setNewsDetailDate(with date: String?) {
        detailDate?.text = date
    }
    
    func setNewsDetailName(with name: String?) {
        detailTitle?.text = name
    }
    
    func setNewsDetailImage(with url: URL?) {
        detailImage?.kf.indicatorType = .activity
        detailImage?.kf.setImage(with: url)
    }
}
