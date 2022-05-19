//
//  BooksCollectionViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import Foundation

class FavoriteBooksViewModel {
    var webServices: WebServicesContract
    var favoriteBooks = [Book]()
    
    init(webServices: WebServicesContract = WebServices()) {
        self.webServices = webServices
    }
    
    var numberOfItems: Int { favoriteBooks.count }
    
    func modelAt(_ index: Int) -> Book {
        favoriteBooks[index]
    }
    
    func getFavoriteBooks(completion: @escaping (String?) -> ()) {
        webServices.loadFavoriteBooks() { [weak self] (books, error) in
            if let books = books {
                self?.favoriteBooks = books.map { Book(book: $0) }
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
}
