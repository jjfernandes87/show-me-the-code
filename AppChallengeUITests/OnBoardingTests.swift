//
//  OnBoardingTests.swift
//  AppChallengeUITests
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest

class OnBoardingTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["UITestingOnboarding"]
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowOnBoard() {
        let app = XCUIApplication()
        XCTAssertTrue(app.buttons["Allow"].exists)
        snapshot("0OnBoarding")
    }
    
}
