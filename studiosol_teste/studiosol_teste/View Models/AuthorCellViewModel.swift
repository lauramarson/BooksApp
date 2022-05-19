//
//  AuthorCellViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import Foundation

class AuthorCellViewModel {
    var author: Author
    
    init(_ author: Author) {
        self.author = author
    }
    
    var name: String { author.name }
    
    var booksCount: Int { author.booksCount }
    
    var imageURL: URL? { URL(string: author.picture) }
}
