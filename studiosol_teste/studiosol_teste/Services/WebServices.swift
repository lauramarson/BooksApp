//
//  WebServices.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation
import Apollo

class WebServices {
    
    func loadFavoriteBooks(completion: @escaping ([FavoriteBooksQuery.Data.FavoriteBook]) -> ()) {
      Network.shared.apollo
        .fetch(query: FavoriteBooksQuery()) { result in
                
        switch result {
        case .success(let graphQLResult):
            var favoriteBooks = [FavoriteBooksQuery.Data.FavoriteBook]()
            if let fetchedBooks = graphQLResult.data?.favoriteBooks {
                favoriteBooks.append(contentsOf: fetchedBooks.compactMap { $0 })
                completion(favoriteBooks)
            }
                    
            if let errors = graphQLResult.errors {
              let message = errors
                    .map { $0.localizedDescription }
                    .joined(separator: "\n")
                print(message)
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
      }
    }
}

extension WebServices {
    func loadBookDetails(id: String, completion: @escaping (BookDetailsQuery.Data.Book) -> ()) {
        
      Network.shared.apollo.fetch(query: BookDetailsQuery(bookID: id)) { result in
        
        switch result {
        case .failure(let error):
            print(error.localizedDescription)
        case .success(let graphQLResult):
            if let book = graphQLResult.data?.book {
                completion(book)
          }
        
          if let errors = graphQLResult.errors {
            let message = errors
                            .map { $0.localizedDescription }
                            .joined(separator: "\n")
            print(message)
          }
        }
      }
    }
}
