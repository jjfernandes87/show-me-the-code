//
//  DetailUITests.swift
//  AppChallengeUITests
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest

class DetailUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDetail() {
        let detail = showDetail()
        XCTAssertTrue(detail.app.navigationBars["Moses & Sons Smash Repairs"].exists)
        XCTAssertEqual(detail.tableQuery.cells.count, 6)
    }
    
    func testReviewAdrressCell() {
        let detail = showDetail()
        XCTAssertTrue(detail.tableQuery.staticTexts["Address"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["192 Harris St, Pyrmont NSW 2009, Australia"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["Phone"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["+61 2 9660 1232"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["Vicinity"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["192 Harris Street, Pyrmont"].exists)
    }
    
    func testReviewRatingsCell() {
        let detail = showDetail()
        XCTAssertTrue(detail.tableQuery.staticTexts["5.0"].exists)
    }
    
    func testReviewTextCell() {
        let detail = showDetail()
        XCTAssertTrue(detail.tableQuery.staticTexts["Tremar Prendergast"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["Linsey Napper"].exists)
        XCTAssertTrue(detail.tableQuery.staticTexts["These guys did a fantastic job of repairing the damage to my front bumper for a very reasonable price. Friendly service too."].exists)
    }
    
}

// MARK: - Helpers
extension DetailUITests {
    
    func showDetail() -> (app: XCUIApplication, tableQuery: XCUIElementQuery)  {
        let app = XCUIApplication()
        let tableQuery = app.tables
        tableQuery.cells.element(boundBy: 0).tap()
        return (app, tableQuery)
    }
    
}
