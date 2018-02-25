//
//  DetailControllerTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class DetailControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testApplyExceptionView() {
        let presenter = DetailPresenter(id: "123456")
        let controller = runViewController(presenter: presenter)
        controller.applyExceptionView()
        XCTAssertEqual(controller.viewStatus, UIBaseViewStatus.exceptions, "view status validate ")
    }
    
    func testApplyPresentingView() {
        let presenter = DetailPresenter(id: "123456")
        let controller = runViewController(presenter: presenter)
        controller.applyPresentingView()
        XCTAssertEqual(controller.viewStatus, UIBaseViewStatus.presenting, "view status validate")
    }
    
}

// MARK: - Helper
extension DetailControllerTests {
    fileprivate func loadViewController() -> DetailController {
        return StoryBoardInfo().instantiateDetailViewController()
    }
    
    fileprivate func runViewController(presenter: DetailPresenter) -> DetailController {
        let controller = loadViewController()
        controller.presenter = presenter
        _ = controller.view
        return controller
    }
}
