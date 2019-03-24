//
//  JSONFetcherTests.swift
//  MindValleyLoaderTests
//
//  Created by Abdul Basit on 24/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import XCTest
@testable import MindValleyLoader
class JSONFetcherTests: XCTestCase {
    var jsonFetcher: JSONFetcher!
    
    override func setUp() {
        jsonFetcher = JSONFetcher()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSONFetcher() {
        jsonFetcher.fetchJSONData(urlString: urlString) { (success, cards) in
            if success{
                XCTAssert(true)
            }
            else{
                XCTAssert(false)
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
