//
//  UsmanPopularUITests.swift
//  UsmanPopularUITests
//
//  Created by Usman Ansari on 28/07/19.
//  Copyright © 2019 Usman Test. All rights reserved.
//

import XCTest

class UsmanPopularUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        XCTAssertNotNil(app.tables)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["By SCOTT SHANE and SARAH KLIFF"]/*[[".cells.staticTexts[\"By SCOTT SHANE and SARAH KLIFF\"]",".staticTexts[\"By SCOTT SHANE and SARAH KLIFF\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertNotNil(app.navigationBars)
        app.navigationBars["Detail"].buttons["NY Times Most Popular"].tap()
    }

}
