//
//  MainRouterTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class MainRouterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNumberOfViewControllers() {
        let router = MainRouter(window: nil)
        router.launch()
        XCTAssertEqual(router.viewControllers.count, 1, "count viewControllers")
    }
    
    func testRootControllerType() {
        let router = MainRouter(window: nil)
        router.launch()
        let controller = router.viewControllers.first
        XCTAssert(controller is ListingController)
        XCTAssert(controller is ListingController, "First controller is ViewController class type")
    }
    
}
