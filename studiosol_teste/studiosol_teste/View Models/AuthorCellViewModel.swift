//
//  AuthorCellViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import Foundation

class AuthorCellViewModel {
    var author: FavoriteAuthorsQuery.Data.FavoriteAuthor
    
    init(_ author: FavoriteAuthorsQuery.Data.FavoriteAuthor) {
        self.author = author
    }
    
    var name: String {
        return author.name
    }
    
    var booksCount: Int {
        return author.booksCount
    }
    
    var imageURL: URL {
        return URL(string: author.picture)!
    }
}
