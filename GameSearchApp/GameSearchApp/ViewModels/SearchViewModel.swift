//
//  SearchViewModel.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

class SearchViewModel: ObservableObject {

    @Published private(set) var cart = [Game]()
    @Published private(set) var games = [Game]()

    func addRemoveGame(_ game: Game) {
        if let index = cart.firstIndex(where: { $0.id == game.id }) {
            cart.remove(at: index)
        } else {
            cart.append(game)
        }
    }

    func inCart(_ game: Game) -> Bool {
        cart.contains(where: { $0.id == game.id })
    }

    // MARK: - Mock Helpers
    func mockGames() {
        games = (1...10).map { index in
            return Game(id: index, name: "Game \(index)")
        }
    }

    func mockCart() {
        cart = (2...5).map { index in
            return Game(id: index, name: "Game \(index)")
        }
    }
}
