//
//  DetailControllerQuickTest.swift
//  AppChallengeTests
//
//  Created by Julio on 27/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import AppChallenge

class DetailControllerQuickTest: QuickSpec {
    
    override func spec() {
        
        var controller: DetailController!
        
        beforeEach {
            let presenter = DetailPresenter(id: "123456")
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
extension DetailControllerQuickTest {
    fileprivate func loadViewController() -> DetailController {
        return StoryBoardInfo().instantiateDetailViewController()
    }
    
    fileprivate func runViewController(presenter: DetailPresenter) -> DetailController {
        let controller = loadViewController()
        controller.presenter = presenter
        return controller
    }
}
