//
//  APIManagerTests.swift
//  UsmanPopularTests
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

import XCTest
@testable import UsmanPopular



class APIManagerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        
    }
    
    func testGetArticles() {
        let expectation = self.expectation(description:  "Web Service Response Received")
        self.measure {
            APIManager.getArticles{ result in
                expectation.fulfill()
                XCTAssertNotNil(result)
            }
            
        }
        
        self.waitForExpectations(timeout: 30) { error in
            XCTAssertNil(error)
        }
    }
    
    func testDownloadImage() {
        var results : Results?

        if let path = Bundle.main.path(forResource: "Mocked", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                results = try! JSONDecoder().decode(Results.self, from: data)
            } catch {
                // handle error
            }
        }
        let expectation = self.expectation(description:  "Web Service Response Received")
        var status = false
        self.measure {
            APIManager.downloadImage(object: results!) { (image, error) in
                if status == false {
                expectation.fulfill()
                XCTAssertNotNil(image)
                    status = true
                }
                
            }        }
        
        self.waitForExpectations(timeout: 30) { error in
            XCTAssertNil(error)
        }
    }
    
}
