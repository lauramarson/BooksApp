//
//  File.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import Foundation

class FavoriteAuthorsViewModel {
    var webServices: WebServices
    var favoriteAuthors = [FavoriteAuthorsQuery.Data.FavoriteAuthor]()
    
    init(webServices: WebServices = WebServices()) {
        self.webServices = webServices
    }
    
    func numberOfItems(_ section: Int) -> Int {
        return favoriteAuthors.count
    }
    
    func modelAt(_ index: Int) -> FavoriteAuthorsQuery.Data.FavoriteAuthor {
        return favoriteAuthors[index]
    }
    
    func getFavoriteAuthors(completion: @escaping (String?) -> ()) {
        webServices.loadFavoriteAuthors() { [weak self] (authors, error) in
            if let authors = authors {
                self?.favoriteAuthors = authors
                completion(nil)
            } else {
                completion(error)
            }
            
        }
    }
}
