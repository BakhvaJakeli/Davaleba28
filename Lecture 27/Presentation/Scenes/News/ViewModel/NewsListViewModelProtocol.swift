//
//  CountriesListViewModel.swift
//  Lecture 27
//
//  Created by Nika Kirkitadze on 07.06.21.
//

import UIKit

protocol NewsListViewModelProtocol: AnyObject {
    func getNewsList(completion: @escaping (([NewsViewModel]) -> Void))
    
    var didFinishedLoading: (() -> Void)? { get set }
    var spinner: UIActivityIndicatorView? { get set }
    var navigationItem: UINavigationItem? { get set }
    func setStyle(on stackVIew: UIStackView)
    
    init(with countriesManager: NewsManagerProtocol)
}

class NewsListViewModel: NewsListViewModelProtocol {
    func getNewsList(completion: @escaping (([NewsViewModel]) -> Void)) {
        newsManager.fetchNews { news in
            DispatchQueue.main.async {
                let newsViewModels = news.list.map { NewsViewModel(list: $0)}
                completion(newsViewModels)
                self.spinner?.stopAnimating()
            }
        }
    }
    
    
    // MARK: - Private properties
    
    private var newsManager: NewsManagerProtocol!
    
    // MARK: - Outputs
    
    var didFinishedLoading: (() -> Void)?
    
    // MARK: - Internal properties
    
    var spinner: UIActivityIndicatorView?
    var navigationItem: UINavigationItem?
    
    required init(with newsManager: NewsManagerProtocol)  {
        self.newsManager = newsManager
    }
    
    func setStyle(on stackVIew: UIStackView) {
        stackVIew.arrangedSubviews.forEach { $0.layer.cornerRadius = 10 }
    }
}
