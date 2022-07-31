//
//  APIRequestTests.swift
//  GameSearchAppTests
//
//  Created by Chad Brady on 7/30/22.
//

import Combine
@testable import GameSearchApp
import XCTest

class APIRequestTests: XCTestCase {

    var cancellables = Set<AnyCancellable>()

    // MARK: - Test Building URL

    func testAPIURL() {
        let expectedURL = URL(string: "https://www.giantbomb.com/api/search?api_key=d49a4662057d3e11a2800f0ec871483e72d40aea&format=json&query=stray&resources=game")!

        let apiURL = APIRequest().requestSearch(str: "stray", nextPage: nil)

        XCTAssertEqual(expectedURL, apiURL)
    }

    func testAPINextPageURL() {
        let expectedURL = URL(string: "https://www.giantbomb.com/api/search?api_key=d49a4662057d3e11a2800f0ec871483e72d40aea&format=json&query=stray&resources=game&page=2")!

        let apiURL = APIRequest().requestSearch(str: "stray", nextPage: 2)

        XCTAssertEqual(expectedURL, apiURL)
    }

    // MARK: - Test Requests

    func testSuccessPath() {
        if
            let url = APIRequest().requestSearch(str: "Stray", nextPage: nil),
            let session = APIRequestStub.stubSuccessfulSession(url: url)
        {

            let request = APIRequest(urlSession: session)
            let expectation = self.expectation(description: "SuccessfulResponse")

            request.request(from: url).sink { result in
                switch result {
                case .failure:
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { games in
                let gameName = "Stray"
                XCTAssertEqual(games.results.first?.name, gameName)
            }.store(in: &cancellables)
        }

        waitForExpectations(timeout: 5)
    }

    func testMalformedJSONPath() {

        if
            let url = APIRequest().requestSearch(str: "Stray", nextPage: nil),
            let session = APIRequestStub.stubMalformedSession(url: url)
        {

            let request = APIRequest(urlSession: session)
            let expectation = self.expectation(description: "MalformedJSON")

                request.request(from: url).sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTAssertTrue(error is Swift.DecodingError)
                    expectation.fulfill()
                case .finished:
                    break
                }
            }, receiveValue: {
                _ in XCTFail()
            }).store(in: &cancellables)
        }
        waitForExpectations(timeout: 5)
    }

    func testEmptyPath() {
        if
            let url = APIRequest().requestSearch(str: "Stray", nextPage: nil),
            let session = APIRequestStub.stubEmptyGamesSession(url: url)
        {

            let request = APIRequest(urlSession: session)
            let expectation = self.expectation(description: "EmptyResponse")

            request.request(from: url).sink(receiveCompletion: { result in
                switch result {
                case .failure:
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            }, receiveValue: { games in
                XCTAssertTrue(games.results.isEmpty)
            }).store(in: &cancellables)
        }
        waitForExpectations(timeout: 5)
    }
}
