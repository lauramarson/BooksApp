//
//  File.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import Foundation

class FavoriteAuthorsViewModel {
    var webServices: WebServices
    var favoriteAuthors = [Author]()
    
    init(webServices: WebServices = WebServices()) {
        self.webServices = webServices
    }
    
    func numberOfItems(_ section: Int) -> Int {
        return favoriteAuthors.count
    }
    
    func modelAt(_ index: Int) -> Author {
        return favoriteAuthors[index]
    }
    
    func getFavoriteAuthors(completion: @escaping (String?) -> ()) {
        webServices.loadFavoriteAuthors() { [weak self] (authors, error) in
            if let authors = authors {
                self?.favoriteAuthors = authors.map { Author(author: $0) }
                completion(nil)
            } else {
                completion(error)
            }
            
        }
    }
}
