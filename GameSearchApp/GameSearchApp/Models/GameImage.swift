//
//  GameImage.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Foundation

struct GameImage: Codable {
    let thumbnail: String?
    let screenSize: String?


    enum CodingKeys: String, CodingKey {
        case thumbnail = "thumb_url"
        case screenSize = "screen_large_url"
    }
}

extension GameImage {
    var thumbnailURL: URL? {
        guard let thumbnail = thumbnail else {
            return nil
        }

        return URL(string: thumbnail)
    }

    var screenURL: URL? {
        guard let screenSize = screenSize else {
            return nil
        }

        return URL(string: screenSize)
    }
}

extension GameImage {
    static func mockGameImage() -> GameImage {
        GameImage(thumbnail: "https://www.giantbomb.com/a/uploads/scale_avatar/0/1992/3391792-4058849583-E2vZw.png",
                  screenSize: nil)
    }
}
