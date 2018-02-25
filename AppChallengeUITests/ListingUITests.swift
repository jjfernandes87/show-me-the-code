//
//  ListingUITests.swift
//  AppChallengeUITests
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest

class ListingUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListing() {
        let app = XCUIApplication()
        let table = app.tables
        XCTAssertEqual(table.cells.count, 5)
        XCTAssertTrue(app.staticTexts["Teste 1"].exists)
        XCTAssertTrue(app.staticTexts["Teste 2"].exists)
        XCTAssertTrue(app.staticTexts["Teste 3"].exists)
        XCTAssertTrue(app.staticTexts["Teste 4"].exists)
        XCTAssertTrue(app.staticTexts["Teste 5"].exists)
        XCTAssertTrue(app.navigationBars["Listing"].exists)
    }
    
}
