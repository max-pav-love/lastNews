//
//  NewsDetailViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var viewModel: NewsDetailViewModelProtocol!
    
    @IBOutlet private weak var detailTitle: UILabel?
    @IBOutlet private weak var detailImage: UIImageView?
    @IBOutlet private weak var detailAuthor: UILabel?
    @IBOutlet private weak var detailDate: UILabel?
    @IBOutlet private weak var detailText: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        detailTitle?.text = viewModel.newsDetailTitle
        detailDate?.text = viewModel.newsDetailDate
        detailText?.text = viewModel.newsDetailText
        detailAuthor?.text = viewModel.newsDetailAuthor
        ImageManager.shared.getImage(url: viewModel.newsDetailImage ?? "", image: detailImage ?? UIImageView())
    }
    
}
