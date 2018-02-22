//
//  ListingPresenterTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class ListingPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func ListingPresenterInit() {
        let presenter = ListingPresenter()
        XCTAssertNil(presenter.router, "ListingPresenter init without router")
        XCTAssertNil(presenter.viewProtocol, "ListingPresenter init without viewController")
    }
    
    func testListingPresenterWithViewProtocol() {
        let controller = loadViewController()
        let presenter = ListingPresenter()
        presenter.viewProtocol = controller
        XCTAssertNotNil(presenter.viewProtocol, "ListingPresenter init with viewController")
    }
    
    func testListingPresenterWithRouter() {
        let presenter = ListingPresenter()
        presenter.router = mainRouter
        XCTAssertNotNil(presenter.router, "ListingPresenter init with router")
    }
    
    func testListingPresenterNotAssignedDataSource() {
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter)
        XCTAssertNil(controller.tableView.dataSource, "Tableview not assigned datasource")
    }
    
    func testListingPresenterAssignedDataSource() {
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter)
        presenter.viewProtocol = controller
        presenter.viewDidLoad()
        XCTAssertNotNil(controller.tableView.dataSource, "Tableview assigned datasource")
    }
}

// MARK: - Helper
extension ListingPresenterTests {
    fileprivate func loadViewController() -> ViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
    
    fileprivate func runViewController(presenter: ListingPresenter) -> ViewController {
        let controller = loadViewController()
        controller.presenter = presenter
        _ = controller.view
        return controller
    }
}

