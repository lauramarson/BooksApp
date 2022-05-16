//
//  DetailBookViewModel.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation

class DetailBookViewModel {
    var book: FavoriteBooksQuery.Data.FavoriteBook
    
    init(book: FavoriteBooksQuery.Data.FavoriteBook) {
        self.book = book
    }
}
