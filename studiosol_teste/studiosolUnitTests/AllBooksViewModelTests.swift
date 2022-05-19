//
//  AllBooksViewModelTests.swift
//  studiosolUnitTests
//
//  Created by Laura Pinheiro Marson on 19/05/22.
//

import XCTest
@testable import studiosol_teste

class AllBooksViewModelTests: XCTestCase {

    var successWebService = SuccessWebService()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        successWebService = SuccessWebService()
    }

    func testBooksCountAfterServiceCall() throws {
        
        let viewModel = AllBooksViewModel(webServices: successWebService)
        
        viewModel.getAllBooks { _ in }
        
        XCTAssertEqual(viewModel.numberOfRows, successWebService.loadedAllBooks.count)
    }
    
    func testIfReturnedModelIsCorrect() throws {

        let viewModel = AllBooksViewModel(webServices: successWebService)
        
        viewModel.getAllBooks { _ in }
        
        let returnedBook = viewModel.modelAt(15)
        
        XCTAssertEqual(successWebService.loadedAllBooks[15].id, returnedBook.id)
    }
}
