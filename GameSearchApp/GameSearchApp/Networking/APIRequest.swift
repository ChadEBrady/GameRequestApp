//
//  APIRequest.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import Combine
import Foundation

class APIRequest {

    private struct Constants {
        static let APIKey = "d49a4662057d3e11a2800f0ec871483e72d40aea"
        static let baseURL = "https://www.giantbomb.com/api/"
        static let apiQueryKey = "api_key"
        static let jsonQueryKey = "format"
        static let jsonQueryValue = "json"
        static let search = "search"
        static let pageQueryKey = "page"
        static let searchQueryKey = "query"
        static let resourcesQueryKey = "resources"
        static let resourcesQueryValue = "game"
    }

    let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func requestSearch(str: String, nextPage: Int?) -> URL? {
        guard
            var urlComponents = URLComponents(string: Constants.baseURL)
        else { return nil }

        urlComponents.path.append(contentsOf: Constants.search)

        let apiQuery = URLQueryItem(name: Constants.apiQueryKey, value: Constants.APIKey)
        let jsonQuery = URLQueryItem(name: Constants.jsonQueryKey, value: Constants.jsonQueryValue)
        let searchQuery = URLQueryItem(name: Constants.searchQueryKey, value: str)
        let resourceQuery = URLQueryItem(name: Constants.resourcesQueryKey, value: Constants.resourcesQueryValue)

        urlComponents.queryItems = [apiQuery, jsonQuery, searchQuery, resourceQuery]

        if
            let nextPage = nextPage
        {
            let pageQuery = URLQueryItem(name: Constants.pageQueryKey, value: String(nextPage))
            urlComponents.queryItems?.append(pageQuery)
        }

        return urlComponents.url
    }

    func request(from url: URL) -> AnyPublisher<GameSearchResult, Error> {
        let jsonDecoder = JSONDecoder()

        return urlSession.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: GameSearchResult.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
