//
//  AllBooksViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import Foundation

class AllBooksViewModel {
    var webServices: WebServices
    var allBooks = [Book]()
    
    init(webServices: WebServices = WebServices()) {
        self.webServices = webServices
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return allBooks.count
    }
    
    func modelAt(_ index: Int) -> Book {
        return allBooks[index]
    }
    
    func getAllBooks(completion: @escaping (String?) -> ()) {
        webServices.loadAllBooks() { [weak self] (books, error) in
            if let books = books {
                self?.allBooks = books.map { Book(book: $0) }
                completion(nil)
            } else {
                completion(error)
            }
            
        }
    }
}
