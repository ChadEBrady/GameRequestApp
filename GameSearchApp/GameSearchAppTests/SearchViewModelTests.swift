//
//  SearchViewModelTests.swift
//  GameSearchAppTests
//
//  Created by Chad Brady on 7/30/22.
//

@testable import GameSearchApp
import XCTest

class SearchViewModelTests: XCTestCase {

    func testAddAndRemoveFromCart() {
        let game = Game.mockGame()
        let searchViewModel = SearchViewModel()

        searchViewModel.addRemoveGame(game)
        XCTAssertEqual(game, searchViewModel.cart.first)
        searchViewModel.addRemoveGame(game)
        XCTAssert(searchViewModel.cart.isEmpty)
    }

    func testInCartIsTrue() {
        let game = Game.mockGame()
        let game2 = Game.mockGame(id: 2)
        let searchViewModel = SearchViewModel()

        searchViewModel.addRemoveGame(game)
        searchViewModel.addRemoveGame(game2)
        XCTAssertTrue(searchViewModel.inCart(game))
    }

    func testGameNotInCart() {
        let game = Game.mockGame()
        let game2 = Game.mockGame(id: 2)
        let searchViewModel = SearchViewModel()

        searchViewModel.addRemoveGame(game)
        XCTAssertFalse(searchViewModel.inCart(game2))
    }
}
