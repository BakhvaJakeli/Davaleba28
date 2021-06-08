//
//  ViewController.swift
//  Lecture 27
//
//  Created by Nika Kirkitadze on 05.06.21.
//

import UIKit

class CountriesListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Private properties
    
    private var viewModel: NewsListViewModelProtocol!
    private var dataSource: NewsDataSource!
    private var newsManager: NewsManagerProtocol!
    
    let stackView = UIStackView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayout()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(class: CountryCell.self)
        configureViewModel()
        bindings()
    }
    
    private func setupLayout() {
        
        viewModel.setStyle(on: stackView)
        
    }
    
    private func configureViewModel() {
        newsManager = NewsManager()
        // DI - Dependenc Injection
        viewModel = NewsListViewModel(with: newsManager)
        dataSource = NewsDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
        viewModel.spinner = spinner
    }
    
    private func bindings() {
        viewModel.didFinishedLoading = {
            self.spinner.stopAnimating()
        }
    }
    
}




