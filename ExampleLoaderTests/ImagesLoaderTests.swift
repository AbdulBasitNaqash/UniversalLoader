//
//  ImagesLoaderTests.swift
//  MindValleyLoaderTests
//
//  Created by Abdul Basit on 24/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import XCTest
@testable import MindValleyLoader

class ImagesLoaderTests: XCTestCase {
    var imagesLoader : ImagesLoader!
    
    let imageURL = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    
    
    override func setUp() {
        imagesLoader = ImagesLoader()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testloadProfileImage() {
        imagesLoader.loadProfileImage(imageView: UIImageView(), urlString: imageURL)
    }
    
    func testloadMainImage(){
        imagesLoader.loadMainImage(loader: Loader(), imageView: UIImageView(), urlString: imageURL, cancelButton: UIButton())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
