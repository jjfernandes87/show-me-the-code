//
//  CairRepairTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class CairRepairTests: XCTestCase {
    
    let carRepairDict: NSDictionary = [
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
    
    func testCarRepairCollection() {
        let json: NSDictionary = ["results" : [carRepairDict]]
        let response = CarRepairCollection.from(json)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.collection.count, 1)
    }
    
    func testCairRepair() {
        let response = CarRepair.from(carRepairDict)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.icon, URL(string: "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"))
        XCTAssertEqual(response?.id, "2f50bbfae132abbb07fa184cb826e1d29555cb53")
        XCTAssertEqual(response?.name, "Moses & Sons Smash Repairs")
        XCTAssertEqual(response?.rating, 5)
        XCTAssertEqual(response?.vicinity, "192 Harris Street, Pyrmont")
    }
    
}
