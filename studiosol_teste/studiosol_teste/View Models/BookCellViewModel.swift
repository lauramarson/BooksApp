//
//  BookCellViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation

class BookCellViewModel {
    var book: FavoriteBooksQuery.Data.FavoriteBook
    
    init(_ book: FavoriteBooksQuery.Data.FavoriteBook) {
        self.book = book
    }
    
    var title: String {
        return book.name
    }
    
    var author: String {
        return book.author.name
    }
    
    var imageURL: URL {
        return URL(string: book.cover)!
    }
}
