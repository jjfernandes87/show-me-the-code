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
    
    func testExample() {
        snapshot("0Launch")
    }
    
}
