//
//  DetailBookViewModelTests.swift
//  studiosolUnitTests
//
//  Created by Laura Pinheiro Marson on 19/05/22.
//

import XCTest
@testable import studiosol_teste

class DetailBookViewModelTests: XCTestCase {

    func testIfLoadedDescriptionIsCorrect() {
        let successWebService = SuccessWebService()
        let book = FavoriteBooksQuery.Data.FavoriteBook(id: "1", name: "Livro1", cover: "", author: FavoriteBooksQuery.Data.FavoriteBook.Author(name: "autor"))
        
        let viewModel = DetailBookViewModel(webServices: successWebService, book: Book(book: book))

        viewModel.getBookDetails { }

        XCTAssertEqual(viewModel.description, successWebService.loadedBookDetails?.description)
    }

}
