//
//  DetailBookViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation

class DetailBookViewModel {
    var webServices: WebServices
    var bookID: String
    
    var book: BookDetailsQuery.Data.Book?
    
    init(webServices: WebServices = WebServices(), bookID: String) {
        self.webServices = webServices
        self.bookID = bookID
    }
}

extension DetailBookViewModel {
    
    var title: String? {
        return book?.name
    }
    
    var author: String? {
        return book?.author.name
    }
    
    var imageURL: URL? {
        return URL(string: book!.cover)
    }

    var description: String? {
        return book?.description
    }
    
    var isFavorite: Bool? {
        return book?.isFavorite
    }
}

extension DetailBookViewModel {
    
    func getBookDetails(completion: @escaping () -> ()) {
        webServices.loadBookDetails(id: bookID) { [weak self] (book) in
            self?.book = book
            completion()
        }
    }
}
