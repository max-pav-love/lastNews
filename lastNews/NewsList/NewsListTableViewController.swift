//
//  NewsListViewController.swift
//  lastNews
//
//  Created by Максим Хлесткин on 16.11.2021.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    private var viewModel: NewsListViewModelProtocol! {
        didSet {
            viewModel.fetchNews {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func viewDidLoad() {
        viewModel = NewsListViewModel()
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setupNavigation(with: viewModel, for: segue)
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        prepareCell(for: indexPath, with: viewModel)
    }
    
    // MARK: - Private
    
    private func prepareCell(for indexPath: IndexPath, with data: NewsListViewModelProtocol) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
    
    private func numberOfRows() -> Int {
        viewModel.numberOfRows() ?? 0
    }
    
    private func numberOfSections() -> Int {
        1
    }
    
    private func setupNavigation(with data: NewsListViewModelProtocol, for segue: UIStoryboardSegue) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailVC = segue.destination as? NewsDetailViewController
        viewModel.selectedRow(for: indexPath)
        detailVC?.viewModel = viewModel.viewModelForSelectedRow()
    }
    
}

// MARK: - UITableView Extensions

extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
