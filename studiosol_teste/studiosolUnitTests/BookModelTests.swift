//
//  BookModelTests.swift
//  studiosolUnitTests
//
//  Created by Laura Pinheiro Marson on 19/05/22.
//

import XCTest
@testable import studiosol_teste

class BookModelTests: XCTestCase {

    func testBookInitWithFavoriteBook() {
        let favoriteBook = FavoriteBooksQuery.Data.FavoriteBook(id: "23", name: "Livro23", cover: "capa", author: FavoriteBooksQuery.Data.FavoriteBook.Author(name: "AutorX"))
        let book = Book(book: favoriteBook)

        XCTAssertEqual(favoriteBook.name, book.title)

    }

}
