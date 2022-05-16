//
//  DetailBookViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation

class DetailBookViewModel {
    var webServices: WebServices
    var favoriteBook: FavoriteBooksQuery.Data.FavoriteBook
    
    var bookDescription: BookDetailsQuery.Data.Book?
    
    init(webServices: WebServices = WebServices(), book: FavoriteBooksQuery.Data.FavoriteBook) {
        self.webServices = webServices
        self.favoriteBook = book
    }
}

extension DetailBookViewModel {
    
    var title: String {
        return favoriteBook.name
    }
    
    var author: String {
        return favoriteBook.author.name
    }
    
    var imageURL: URL {
        return URL(string: favoriteBook.cover)!
    }

    var description: String? {
        return bookDescription?.description
    }
}

extension DetailBookViewModel {
    
    func getBookDetails(completion: @escaping () -> ()) {
        webServices.loadBookDetails(id: favoriteBook.id) { [weak self] (book) in
            self?.bookDescription = book
            completion()
        }
    }
}
