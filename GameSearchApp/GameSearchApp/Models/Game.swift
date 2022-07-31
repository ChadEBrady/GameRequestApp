//
//  Game.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

struct Game: Codable,
             Identifiable
{
    let id: Int
    let image: GameImage
    let name: String
    let deck: String

    enum CodingKeys: String, CodingKey {
        case id
        case image
        case name
        case deck
    }
}

extension Game: Equatable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
}

extension Game {
    static func mockGame(id: Int = 1) -> Game {
        Game(id: id, image: GameImage.mockGameImage(), name: "Stray", deck: "some words")
    }
}
