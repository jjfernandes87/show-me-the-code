//
//  OnBoardingQuickTest.swift
//  AppChallengeTests
//
//  Created by Julio on 27/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import AppChallenge

class OnBoardingQuickTest: QuickSpec {
    
    override func spec() {
        
        var controller: OnboardingController!
        
        describe("Onboarding validate text") {
            beforeEach {
                controller = self.runViewController()
                let _ = controller.view
            }
            
            it("uilabel should be We would like to get your location, to look for the car repair nearest") {
                expect(controller.message.text).to(equal("We would like to get your location, to look for the car repair nearest"))
            }
        }
        
    }
    
}

// MARK: - Helper
extension OnBoardingQuickTest {
    fileprivate func loadViewController() -> OnboardingController {
        return StoryBoardInfo().instantiateOnboardingViewController()
    }
    
    fileprivate func runViewController() -> OnboardingController {
        let controller = loadViewController()
        return controller
    }
}
