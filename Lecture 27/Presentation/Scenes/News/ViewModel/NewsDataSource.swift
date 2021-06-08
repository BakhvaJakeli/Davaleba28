//
//  CountriesDataSource.swift
//  Lecture 27
//
//  Created by Nika Kirkitadze on 05.06.21.
//

import UIKit

class NewsDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private properties
    
    private var tableView: UITableView!
    private var viewModel: NewsListViewModelProtocol!
    
    private var NewsListArray = [NewsViewModel]()
    
    init(with tableView: UITableView, viewModel: NewsListViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    
    func refresh() {
        viewModel.getNewsList { news in
            self.NewsListArray = news
        }
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CountryCell.self, for: indexPath)
        cell.configure(with: NewsListArray[indexPath.row])
        return cell
    }
    
}


// MARK: - UITableViewDelegate

extension NewsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

