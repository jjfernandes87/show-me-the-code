//
//  ListingControllerQuickTest.swift
//  AppChallengeTests
//
//  Created by Julio on 27/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import AppChallenge

class ListingControllerQuickTest: QuickSpec {
        
    override func spec() {
        
        var controller: ListingController!
        
        beforeEach {
            let presenter = ListingPresenter()
            controller = self.runViewController(presenter: presenter)
        }
        
        describe("set statusView .exception") {
            
            beforeEach{
                let _ = controller.view
                controller.applyExceptionView()
            }
            
            it("should be set viewStatus like exceptions"){
                expect(controller.viewStatus).to(equal(UIBaseViewStatus.exceptions))
            }
            
        }
        
        describe("set statusView .missResult") {
            
            beforeEach{
                let _ = controller.view
                controller.applyZeroResultView()
            }
            
            it("should be set viewStatus like miss result"){
                expect(controller.viewStatus).to(equal(UIBaseViewStatus.missResult))
            }
            
        }
        
        describe("set statusView .presenting") {
            
            beforeEach{
                let _ = controller.view
                controller.applyPresentingView()
            }
            
            it("should be set viewStatus like presenting"){
                expect(controller.viewStatus).to(equal(UIBaseViewStatus.presenting))
            }
            
        }
    }
    
}

// MARK: - Helper
extension ListingControllerQuickTest {
    fileprivate func loadViewController() -> ListingController {
        return StoryBoardInfo().instantiateListingViewController()
    }
    
    fileprivate func runViewController(presenter: ListingPresenter) -> ListingController {
        let controller = loadViewController()
        controller.presenter = presenter
        return controller
    }
}
