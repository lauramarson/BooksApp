//
//  Author.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 19/05/22.
//

import Foundation

struct Author {
    var name: String
    var picture: String
    var booksCount: Int
    
    init(author: FavoriteAuthorsQuery.Data.FavoriteAuthor) {
        self.name = author.name
        self.picture = author.picture
        self.booksCount = author.booksCount
    }
}
