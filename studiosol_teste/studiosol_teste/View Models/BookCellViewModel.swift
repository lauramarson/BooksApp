//
//  BookCellViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import Foundation

class BookCellViewModel {
    var book: AllBooksQuery.Data.AllBook
    
    init(_ book: AllBooksQuery.Data.AllBook) {
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
