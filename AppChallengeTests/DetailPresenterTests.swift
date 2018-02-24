//
//  DetailPresenterTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class DetailPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func DetailPresenterInit() {
        let presenter = DetailPresenter(id: "123456")
        XCTAssertEqual(presenter.placeId, "123456", "placeId validate")
        XCTAssertNil(presenter.viewProtocol, "DetailPresenter init without viewController")
    }
    
    func testDetailPresenterWithViewProtocol() {
        let controller = loadViewController()
        let presenter = DetailPresenter(id: "12345")
        presenter.viewProtocol = controller
        XCTAssertNotNil(presenter.viewProtocol, "ListingPresenter init with viewController")
    }
    
}

// MARK: - Helper
extension DetailPresenterTests {
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

