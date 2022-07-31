//
//  APIRequestTests.swift
//  GameSearchAppTests
//
//  Created by Chad Brady on 7/30/22.
//

@testable import GameSearchApp
import XCTest

class APIRequestTests: XCTestCase {

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
}
