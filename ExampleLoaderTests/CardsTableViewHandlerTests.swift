//
//  CardsTableViewHandlerTests.swift
//  MindValleyLoaderTests
//
//  Created by Abdul Basit on 24/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import XCTest
@testable import MindValleyLoader

class CardsTableViewHandlerTests: XCTestCase {

    var cardsTableViewHandler : CardsTableViewHandler!
    
    override func setUp() {
        cardsTableViewHandler = CardsTableViewHandler()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializeComponents(){
        cardsTableViewHandler.intializeComponents(cards: [CardModel](), activityIndicator: UIActivityIndicatorView())
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
