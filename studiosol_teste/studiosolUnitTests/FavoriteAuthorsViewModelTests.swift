//
//  FavoriteAuthorsViewModelTests.swift
//  studiosolUnitTests
//
//  Created by Laura Pinheiro Marson on 19/05/22.
//

import XCTest
@testable import studiosol_teste

class FavoriteAuthorsViewModelTests: XCTestCase {

    var successWebService = SuccessWebService()

    override func setUpWithError() throws {
        try super.setUpWithError()

        successWebService = SuccessWebService()
    }

    func testAuthorsCountAfterServiceCall() throws {

        let viewModel = FavoriteAuthorsViewModel(webServices: successWebService)

        viewModel.getFavoriteAuthors { _ in }

        XCTAssertEqual(viewModel.numberOfItems(1), successWebService.loadedFavoriteAuthors.count)
    }

    func testIfReturnedModelIsCorrect() throws {

        let viewModel = FavoriteAuthorsViewModel(webServices: successWebService)

        viewModel.getFavoriteAuthors { _ in }

        let returnedAuthor = viewModel.modelAt(2)

        XCTAssertEqual(successWebService.loadedFavoriteAuthors[2].name, returnedAuthor.name)
    }

}
