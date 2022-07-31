//
//  SearchViewModel.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {

    private let apiRequest = APIRequest()
    @Published private(set) var cart = [Game]()
    @Published private(set) var games = [Game]()

    private var cancellables = Set<AnyCancellable>()
    private var pageNumber = 1

    private(set) var lastPage: Bool = false

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

    func fetch(str: String, nextPage: Bool = false) {
        updatePageNumber(isNextPage: nextPage)

        if
            let url = APIRequest().requestSearch(str: str, nextPage: pageNumber),
            !lastPage
        {
            makeRequest(url: url, isNextPage: nextPage)
        }
    }

    private func updatePageNumber(isNextPage: Bool) {
        if isNextPage {
            pageNumber += 1
        } else {
            pageNumber = 1
            lastPage = false
        }
    }

    private func makeRequest(url: URL, isNextPage: Bool) {

        apiRequest.request(from: url)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in }) { [weak self] result in
                guard let self = self else { return }
                if isNextPage {
                    self.games.append(contentsOf: result.results)
                } else {
                    self.games = result.results
                }
                self.lastPage = self.games.count == result.totalResultCount
            }.store(in: &cancellables)
    }

    // MARK: - Mock Helpers
    func mockGames() {
        games = (1...10).map { index in
            return Game(
                id: index,
                image: GameImage.mockGameImage(),
                name: "Game \(index)")
        }
    }

    func mockCart() {
        cart = (2...5).map { index in
            return Game(
                id: index,
                image: GameImage.mockGameImage(),
                name: "Game \(index)")
        }
    }
}
