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
    
    let carRepairCardDict: NSDictionary = [
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
        "id": "2f50bbfae132abbb07fa184cb826e1d29555cb53",
        "name": "Moses & Sons Smash Repairs",
        "place_id": "ChIJDSR7MTGuEmsR9-82GmIk__E",
        "rating": 5,
        "vicinity": "192 Harris Street, Pyrmont",
        "geometry": ["location": [ "lat": -33.87054500000001, "lng": 151.194722] ]
    ]
    
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
        XCTAssertNil(controller.tableView.delegate, "Tableview not assigned delegate")
    }
    
    func testListingPresenterAssignedDataSource() {
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter)
        presenter.viewProtocol = controller
        presenter.viewDidLoad()
        XCTAssertNotNil(controller.tableView.dataSource, "Tableview assigned datasource")
        XCTAssertNotNil(controller.tableView.delegate, "Tableview assigned delegate")
    }
    
    func testTableViewCount() {
        let response = CarRepairCard.from(carRepairCardDict)
        XCTAssertNotNil(response)
        
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter, item: [response!])
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 1, "TableView numberOfRows count")
    }
    
    func testTableViewCell() {
        let response = CarRepairCard.from(carRepairCardDict)
        XCTAssertNotNil(response)
        
        let presenter = ListingPresenter()
        let controller = runViewController(presenter: presenter, item: [response!])
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 1, "TableView numberOfRows count")
        
        let cell = controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell is CardCell)
        XCTAssertEqual((cell as! CardCell).ratingValue.textColor, UIColor.green)
        XCTAssertEqual((cell as! CardCell).name.text, "Moses & Sons Smash Repairs")
    }
    
}

// MARK: - Helper
extension ListingPresenterTests {
    fileprivate func loadViewController() -> ListingController {
        return StoryBoardInfo().instantiateListingViewController()
    }
    
    fileprivate func runViewController(presenter: ListingPresenter) -> ListingController {
        let controller = loadViewController()
        controller.presenter = presenter
        _ = controller.view
        return controller
    }
    
    fileprivate func runViewController(presenter: ListingPresenter, item: [CarRepairCard]) -> ListingController {
        let controller = loadViewController()
        presenter.reloadData(result: item)
        presenter.viewProtocol = controller
        controller.presenter = presenter
        _ = controller.view
        return controller
    }
}

