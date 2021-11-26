//
//  NewsDetailViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit
import Kingfisher

class NewsDetailViewController: UIViewController {
    
    var currentNew: NewsData?
    
    @IBOutlet private weak var detailTitle: UILabel?
    @IBOutlet private weak var detailImage: UIImageView?
    @IBOutlet private weak var detailAuthor: UILabel?
    @IBOutlet private weak var detailDate: UILabel?
    @IBOutlet private weak var detailText: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetail()
    }
    
    func configureDetail() {
        detailTitle?.text = currentNew?.title
        detailText?.text = currentNew?.content
        detailAuthor?.text = currentNew?.author
        detailDate?.text = currentNew?.date
        detailImage?.kf.indicatorType = .activity
        detailImage?.kf.setImage(with: currentNew?.imageUrl)
    }
    
}
