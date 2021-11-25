//
//  NewsDetailViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 24.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NewsDetailDisplayLogic: AnyObject {
    func displayDetail(viewModel: NewsDetail.ShowDetail.ViewModel)
}

class NewsDetailViewController: UIViewController {
    
    @IBOutlet private weak var detailTitle: UILabel?
    @IBOutlet private weak var detailImage: UIImageView?
    @IBOutlet private weak var detailAuthor: UILabel?
    @IBOutlet private weak var detailDate: UILabel?
    @IBOutlet private weak var detailText: UITextView?
    
    var interactor: NewsDetailBusinessLogic?
    var router: (NSObjectProtocol & NewsDetailRoutingLogic & NewsDetailDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = NewsDetailInteractor()
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigation(by: segue)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
    }
    
    // MARK: - Private
    
    private func showDetail() {
        let request = NewsDetail.ShowDetail.Request()
        interactor?.showDetail(request: request)
    }
    
    private func navigation(by segue: UIStoryboardSegue) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
}

extension NewsDetailViewController: NewsDetailDisplayLogic {
    
    func displayDetail(viewModel: NewsDetail.ShowDetail.ViewModel) {
        detailTitle?.text = viewModel.dispalayedDetail.detailNewsName
        detailDate?.text = viewModel.dispalayedDetail.detailNewsDate
        detailAuthor?.text = viewModel.dispalayedDetail.detailNewsAuthor
        detailText?.text = viewModel.dispalayedDetail.detailNewsContent
        ImageManager.shared.getImage(url: viewModel
                                        .dispalayedDetail
                                        .detailNewsImageUrl!,
                                     image: detailImage ?? UIImageView())
    }
    
}
