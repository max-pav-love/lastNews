//
//  NewsDetailViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var currentNew: NewsData!
    
    @IBOutlet private weak var detailTitle: UILabel?
    @IBOutlet private weak var detailImage: UIImageView?
    @IBOutlet private weak var detailAuthor: UILabel?
    @IBOutlet private weak var detailDate: UILabel?
    @IBOutlet private weak var detailText: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetail(current: currentNew)
    }
    
    func configureDetail(current new: NewsData) {
        detailTitle?.text = new.title
        detailText?.text = new.content
        detailAuthor?.text = new.author
        detailDate?.text = new.date
        ImageManager.shared.getImage(url: new.imageUrl, image: detailImage ?? UIImageView())
    }
    
}
