//
//  Game.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

struct Game: Codable,
             Identifiable,
             Equatable
{
    let id: Int
    let name: String
}
