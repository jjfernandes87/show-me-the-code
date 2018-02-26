//
//  OnBoardingControllerTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class OnBoardingControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOnBoarding() {
        let controller = runViewController()
        XCTAssertEqual(controller.message.text, "We would like to get your location, to look for the car repair nearest")
    }

}

// MARK: - Helper
extension OnBoardingControllerTests {
    fileprivate func loadViewController() -> OnboardingController {
        return StoryBoardInfo().instantiateOnboardingViewController()
    }
    
    fileprivate func runViewController() -> OnboardingController {
        let controller = loadViewController()
        _ = controller.view
        return controller
    }
}
