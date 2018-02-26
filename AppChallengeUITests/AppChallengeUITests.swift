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
        app.launchArguments = ["UITesting"]
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListing() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["Teste 1"].exists)
        XCTAssertTrue(app.navigationBars["Listing"].exists)
        snapshot("1Listing")
    }
    
    func testListingPushToDetail() {
        let app = XCUIApplication()
        let tableQuery = app.tables
        tableQuery.cells.element(boundBy: 0).tap()
        XCTAssertFalse(app.staticTexts["Teste 1"].exists)
    }
    
    func testDetail() {
        let app = XCUIApplication()
        let tableQuery = app.tables
        tableQuery.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.navigationBars["Moses & Sons Smash Repairs"].exists)
        snapshot("2Detail")
    }
}
