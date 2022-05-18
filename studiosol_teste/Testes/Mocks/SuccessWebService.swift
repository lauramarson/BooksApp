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
    
    func loadFavoriteBooks(completion: @escaping ([FavoriteBooksQuery.Data.FavoriteBook]?, String?) -> ()) {
        
        for n in 1...10 {
            loadedFavoriteBooks.append(FavoriteBooksQuery.Data.FavoriteBook(id: "\(n)", name: "Livro\(n)", cover: "", author: FavoriteBooksQuery.Data.FavoriteBook.Author(name: "")))
        }
        
        completion(loadedFavoriteBooks, nil)
    }

}
