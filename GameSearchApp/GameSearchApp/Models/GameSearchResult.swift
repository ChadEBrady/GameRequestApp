//
//  GameSearchResult.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

struct GameSearchResult: Codable {
    let totalResultCount: Int
    let results: [Game]

    enum CodingKeys: String, CodingKey {
        case totalResultCount = "number_of_total_results"
        case results
    }
}
