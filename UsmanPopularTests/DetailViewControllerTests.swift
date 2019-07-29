//
//  DetailViewControllerTests.swift
//  UsmanPopularTests
//
//  Created by Usman Ansari on 29/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

import Foundation

import XCTest
@testable import UsmanPopular

class DetailViewControllerTests: XCTestCase {
    var testVC: DetailViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testVC = DetailViewController()
        _ = testVC.view

    }
    
    func testVCNotBeNil() {
        var results : Results?
        
        if let path = Bundle.main.path(forResource: "Mocked", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                results = try! JSONDecoder().decode(Results.self, from: data)
            } catch {
                // handle error
            }
        }
        testVC.detailItem = results
        _ = testVC.view

        XCTAssertNotNil(testVC)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

