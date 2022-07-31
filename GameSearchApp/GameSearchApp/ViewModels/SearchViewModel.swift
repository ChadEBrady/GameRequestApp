//
//  SearchViewModel.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

class SearchViewModel: ObservableObject {

    @Published private(set) var games = [Game]()

    // MARK: - Mock Helpers
    func mockGames() {
        games = (1...10).map { index in
            return Game(id: index, name: "Game \(index)")
        }
    }
}
