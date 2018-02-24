//
//  AppChallengeUITests.swift
//  AppChallengeUITests
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest

class AppChallengeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListing() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["Moses & Sons Smash Repairs 2"].exists)
        XCTAssertTrue(app.navigationBars["Listing"].exists)
        snapshot("0Listing")
    }
    
    func testListingPushToDetail() {
        let app = XCUIApplication()
        let tableQuery = app.tables
        tableQuery.cells.element(boundBy: 0).tap()
        XCTAssertFalse(app.staticTexts["Moses & Sons Smash Repairs 2"].exists)
    }
    
    func testDetail() {
        let app = XCUIApplication()
        let tableQuery = app.tables
        tableQuery.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.navigationBars["Detail"].exists)
        snapshot("1Detail")
    }
}
