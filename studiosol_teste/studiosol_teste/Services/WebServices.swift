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

extension WebServices {
    
    func loadFavoriteAuthors(completion: @escaping ([FavoriteAuthorsQuery.Data.FavoriteAuthor]) -> ()) {
      Network.shared.apollo
        .fetch(query: FavoriteAuthorsQuery()) { result in
                
        switch result {
        case .success(let graphQLResult):
            var favoriteAuthors = [FavoriteAuthorsQuery.Data.FavoriteAuthor]()
            if let fetchedAuthors = graphQLResult.data?.favoriteAuthors {
                favoriteAuthors.append(contentsOf: fetchedAuthors.compactMap { $0 })
                completion(favoriteAuthors)
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
    
    func loadAllBooks(completion: @escaping ([AllBooksQuery.Data.AllBook]) -> ()) {
      Network.shared.apollo
        .fetch(query: AllBooksQuery()) { result in
                
        switch result {
        case .success(let graphQLResult):
            var allBooks = [AllBooksQuery.Data.AllBook]()
            if let fetchedBooks = graphQLResult.data?.allBooks {
                allBooks.append(contentsOf: fetchedBooks.compactMap { $0 })
                completion(allBooks)
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
    func loadUserPicture(completion: @escaping (String) -> ()) {
        
      Network.shared.apollo.fetch(query: UserPictureQuery()) { result in
        
        switch result {
        case .failure(let error):
            print(error.localizedDescription)
        case .success(let graphQLResult):
            if let userPicture = graphQLResult.data?.userPicture {
                completion(userPicture)
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
