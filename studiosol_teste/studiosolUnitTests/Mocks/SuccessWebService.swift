//
//  SuccessWebService.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 18/05/22.
//

import Foundation
@testable import studiosol_teste

class SuccessWebService: WebServicesContract {
    
    var loadedFavoriteBooks = [FavoriteBooksQuery.Data.FavoriteBook]()
    var loadedAllBooks = [AllBooksQuery.Data.AllBook]()
    var loadedFavoriteAuthors = [FavoriteAuthorsQuery.Data.FavoriteAuthor]()
    var loadedBookDetails: BookDetailsQuery.Data.Book?
    
    func loadFavoriteBooks(completion: @escaping ([FavoriteBooksQuery.Data.FavoriteBook]?, String?) -> ()) {
        
        for n in 1...10 {
            loadedFavoriteBooks.append(FavoriteBooksQuery.Data.FavoriteBook(id: "\(n)", name: "Livro\(n)", cover: "", author: FavoriteBooksQuery.Data.FavoriteBook.Author(name: "")))
        }
        
        completion(loadedFavoriteBooks, nil)
    }
    
    func loadAllBooks(completion: @escaping ([AllBooksQuery.Data.AllBook]?, String?) -> ()) {
        
        for n in 1...20 {
            loadedAllBooks.append(AllBooksQuery.Data.AllBook(id: "\(n)", name: "Livro\(n)", cover: "", author: AllBooksQuery.Data.AllBook.Author(name: "")))
        }
        
        completion(loadedAllBooks, nil)
    }
    
    func loadFavoriteAuthors(completion: @escaping ([FavoriteAuthorsQuery.Data.FavoriteAuthor]?, String?) -> ()) {
        
        for n in 1...4 {
            loadedFavoriteAuthors.append(FavoriteAuthorsQuery.Data.FavoriteAuthor(picture: "", name: "Author\(n)", booksCount: 1))
        }
        
        completion(loadedFavoriteAuthors, nil)
    }
    
    func loadBookDetails(id: String, completion: @escaping (BookDetailsQuery.Data.Book) -> ()) {
        
        loadedBookDetails = BookDetailsQuery.Data.Book(id: "1", description: "descrição aleatória", isFavorite: true)
        
        completion(loadedBookDetails!)
    }

}
