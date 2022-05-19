//
//  DetailBookViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation

class DetailBookViewModel {
    var webServices: WebServices
    var book: Book

    init(webServices: WebServices = WebServices(), book: Book) {

        self.webServices = webServices
        self.book = book
    }
}

extension DetailBookViewModel {

    var title: String { book.title }

    var author: String { book.author }

    var imageURL: URL? { URL(string: book.cover) }

    var description: String { book.description }

    var isFavorite: Bool? { book.isFavorite }
}

extension DetailBookViewModel {

    func getBookDetails(completion: @escaping () -> ()) {
        webServices.loadBookDetails(id: book.id) { [weak self] (bookDetails) in
            self?.book.description = bookDetails.description
            self?.book.isFavorite = bookDetails.isFavorite
            completion()
        }
    }
}
