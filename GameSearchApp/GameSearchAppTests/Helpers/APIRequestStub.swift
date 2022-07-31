//
//  APIRequestStub.swift
//  GameSearchAppTests
//
//  Created by Chad Brady on 7/30/22.
//

@testable import GameSearchApp
import Foundation

class APIRequestStub {

    static func stubSuccessfulSession(url: URL) -> URLSession? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase

        if
            let data = try? jsonEncoder.encode(stubGames()),
            let response = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
        {
            URLProtocolStub.requestHandler = { request in
                guard
                    let requestURL = request.url,
                        requestURL == url
                else {
                    throw URLError(URLError.Code.badURL)
                }

                return (response, data)
            }

            let config = URLSessionConfiguration.ephemeral
            config.protocolClasses = [URLProtocolStub.self]

            let session = URLSession(configuration: config)

            return session
        }

        return nil
    }

    static func stubMalformedSession(url: URL) -> URLSession? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase

        if
            let badData = "".data(using: .utf8),
            let response = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
        {
            URLProtocolStub.requestHandler = { request in
                guard
                    let requestURL = request.url,
                        requestURL == url else
                {
                    throw URLError(URLError.Code.badURL)
                }

                return (response, badData)
            }

            let config = URLSessionConfiguration.ephemeral
            config.protocolClasses = [URLProtocolStub.self]

            let session = URLSession(configuration: config)
            return session
        }

        return nil
    }

    static func stubEmptyGamesSession(url: URL) -> URLSession? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase

        if
            let data = try? jsonEncoder.encode(stubEmptyGames()),
            let response = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
        {
            URLProtocolStub.requestHandler = { request in
                guard
                    let requestURL = request.url,
                        requestURL == url
                else {
                    throw URLError(URLError.Code.badURL)
                }

                return (response, data)
            }

            let config = URLSessionConfiguration.ephemeral
            config.protocolClasses = [URLProtocolStub.self]

            let session = URLSession(configuration: config)

            return session
        }

        return nil
    }

    // MARK: - Helpers

    static func stubGames() -> GameSearchResult {
        let game = Game.mockGame()
        let game2 = Game.mockGame(id: 2)
        return GameSearchResult(results: [game, game2])
    }

    static func stubEmptyGames() -> GameSearchResult {
        return GameSearchResult(results: [])
    }
}
