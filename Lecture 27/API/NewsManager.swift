//
//  CountriesManager.swift
//  Lecture 27
//
//  Created by Nika Kirkitadze on 05.06.21.
//

import Foundation

protocol NewsManagerProtocol: AnyObject {
    func fetchNews(completion: @escaping ((News) -> Void))
}

class NewsManager: NewsManagerProtocol {
    
    func fetchNews(completion: @escaping ((News) -> Void)) {
        let url = "https://run.mocky.io/v3/74fab3ed-b65f-457c-9f44-df9d3ef4dec4"
        NetworkManager.shared.get(url: url) { (result: Result<News, Error>) in
            switch result {
            case .success(let news):
                completion(news)
            case .failure(let error):
                print(error)
            }
        }
    }
}
