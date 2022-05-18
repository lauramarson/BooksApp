//
//  FavoriteBooksViewModelTests.swift
//  studiosolUnitTests
//
//  Created by Laura Pinheiro Marson on 18/05/22.
//

import XCTest
@testable import studiosol_teste

class FavoriteBooksViewModelTests: XCTestCase {
    
    var successWebService = SuccessWebService()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        successWebService = SuccessWebService()
    }

    func testBooksCountAfterServiceCall() throws {
        
        let viewModel = FavoriteBooksViewModel(webServices: successWebService)
        
        viewModel.getFavoriteBooks { _ in }
        
        XCTAssertEqual(viewModel.numberOfItems(), successWebService.loadedFavoriteBooks.count)
    }
    
    func testIfReturnedModelIsCorrect() throws {

        let viewModel = FavoriteBooksViewModel(webServices: successWebService)
        
        viewModel.getFavoriteBooks { _ in }
        
        let returnedBook = viewModel.modelAt(5)
        
        XCTAssertEqual(successWebService.loadedFavoriteBooks[5].id, returnedBook.id)
    }

}
