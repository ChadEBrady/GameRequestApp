//
//  GameImage.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

struct GameImage: Codable {
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case thumbnail = "thumb_url"
    }
}

extension GameImage {
    var thumbnailURL: URL? {
        guard let thumbnail = thumbnail else {
            return nil
        }

        return URL(string: thumbnail)
    }
}

extension GameImage {
    static func mockGameImage() -> GameImage {
        GameImage(thumbnail: "https://www.giantbomb.com/a/uploads/scale_avatar/0/1992/3391792-4058849583-E2vZw.png")
    }
}
