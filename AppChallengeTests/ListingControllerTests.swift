//
//  ListingControllerTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class ListingControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testApplyExceptionView() {
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter)
        controller.applyExceptionView()
        XCTAssertEqual(controller.viewStatus, UIBaseViewStatus.exceptions, "view status validate ")
    }
    
    func testApplyZeroResultView() {
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter)
        controller.applyZeroResultView()
        XCTAssertEqual(controller.viewStatus, UIBaseViewStatus.missResult, "view status validate")
    }
    
    func testApplyPresentingView() {
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter)
        controller.applyPresentingView()
        XCTAssertEqual(controller.viewStatus, UIBaseViewStatus.presenting, "view status validate")
    }
    
}

// MARK: - Helper
extension ListingControllerTests {
    fileprivate func loadViewController() -> ListingController {
        return StoryBoardInfo().instantiateListingViewController()
    }
    
    fileprivate func runViewController(presenter: ListingPresenter) -> ListingController {
        let controller = loadViewController()
        controller.presenter = presenter
        _ = controller.view
        return controller
    }
}

