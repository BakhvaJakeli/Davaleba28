//
//  CountryViewModel.swift
//  Lecture 27
//
//  Created by Nika Kirkitadze on 07.06.21.
//

import Foundation

struct NewsViewModel {
    
    private var list: List
    
    init(list: List) {
        self.list = list
    }
    
    var newsImg: URL? {
        URL(string:list.bigCoverPhotoURL)
    }
    
    var content: String {
        list.content
    }
    
    var type: String {
        list.articleSource?.rawValue ?? ""
    }
    
    var time: String {
        list.time
    }
    
}
