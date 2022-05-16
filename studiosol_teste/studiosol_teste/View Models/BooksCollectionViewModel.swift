//
//  BooksCollectionViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import Foundation

class BooksCollectionViewModel {
    var webServices: WebServices
    var favoriteBooks = [FavoriteBooksQuery.Data.FavoriteBook]()
    
    init(webServices: WebServices = WebServices()) {
        self.webServices = webServices
    }
    
    func numberOfItems(_ section: Int) -> Int {
        return favoriteBooks.count
    }
    
    func modelAt(_ index: Int) -> FavoriteBooksQuery.Data.FavoriteBook {
        return favoriteBooks[index]
    }
    
//    func posterAt(_ index: Int) -> URL {
//        return URL(string: favoriteBooks[index].cover)!
//    }
    
    func getFavoriteBooks(completion: @escaping () -> ()) {
        webServices.loadFavoriteBooks() { [weak self] (books) in
            self?.favoriteBooks = books
            completion()
        }
    }
}
