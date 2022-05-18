//
//  BooksCollectionViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import Foundation

class FavoriteBooksViewModel {
    var webServices: WebServicesContract
    var favoriteBooks = [FavoriteBooksQuery.Data.FavoriteBook]()
    
    init(webServices: WebServicesContract = WebServices()) {
        self.webServices = webServices
    }
    
    func numberOfItems() -> Int {
        return favoriteBooks.count
    }
    
    func modelAt(_ index: Int) -> FavoriteBooksQuery.Data.FavoriteBook {
        return favoriteBooks[index]
    }
    
    func getFavoriteBooks(completion: @escaping () -> ()) {
        webServices.loadFavoriteBooks() { [weak self] (books) in
            self?.favoriteBooks = books
            completion()
        }
    }
}
