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
    
    let mock = JsonMock()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCarRepairCollection() {
        let json: NSDictionary = ["results" : [mock.carRepairCardDict]]
        let response = CarRepairCollection.from(json)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.collection.count, 1)
    }
    
    func testCarRepairCollectionWithoutResult() {
        let json: NSDictionary = ["result" : [mock.carRepairCardDict]]
        let response = CarRepairCollection.from(json)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.collection.count, 0)
    }
    
    func testCairRepairCard() {
        let response = CarRepairCard.from(mock.carRepairCardDict)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.icon, URL(string: "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"))
        XCTAssertEqual(response?.id, "2f50bbfae132abbb07fa184cb826e1d29555cb53")
        XCTAssertEqual(response?.name, "Moses & Sons Smash Repairs")
        XCTAssertEqual(response?.rating, 5)
        XCTAssertEqual(response?.vicinity, "192 Harris Street, Pyrmont")
    }
    
    func testCardRepair() {
        let response = CarRepair.from(mock.carRepairDict)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.icon, URL(string: "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"))
        XCTAssertEqual(response?.id, "2f50bbfae132abbb07fa184cb826e1d29555cb53")
        XCTAssertEqual(response?.name, "Moses & Sons Smash Repairs")
        XCTAssertEqual(response?.rating, 5)
        XCTAssertEqual(response?.vicinity, "192 Harris Street, Pyrmont")
        XCTAssertEqual(response?.formattedAddress, "192 Harris St, Pyrmont NSW 2009, Australia")
        XCTAssertEqual(response?.formattedPhoneNumber, "(02) 9660 1232")
        XCTAssertEqual(response?.internationalPhoneNumber, "+61 2 9660 1232")
        XCTAssertEqual(response?.url, URL(string: "https://maps.google.com/?cid=17437696285967052791"))
    }
    
    func testReview() {
        let response = Review.from(mock.reviewDict)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.authorName, "Tremar Prendergast")
        XCTAssertEqual(response?.authorUrl, URL(string: "https://www.google.com/maps/contrib/116179720699577130416/reviews"))
        XCTAssertEqual(response?.language, "en")
        XCTAssertEqual(response?.profilePhotoUrl, URL(string: "https://lh3.googleusercontent.com/-jSkW7yNlS7Q/AAAAAAAAAAI/AAAAAAAAACg/m4a5xmR5v1s/s128-c0x00000000-cc-rp-mo/photo.jpg"))
        XCTAssertEqual(response?.rating, 5)
        XCTAssertEqual(response?.relativeTimeDescription, "2 years ago")
        XCTAssertEqual(response?.text, "These guys did a fantastic job of repairing the damage to my front bumper for a very reasonable price. Friendly service too.")
    }
}
