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
        "geometry": ["location": [ "lat": -33.87054500000001, "lng": 151.194722] ],
        "formatted_address": "192 Harris St, Pyrmont NSW 2009, Australia",
        "formatted_phone_number": "(02) 9660 1232",
        "international_phone_number": "+61 2 9660 1232",
        "url": "https://maps.google.com/?cid=17437696285967052791"
    ]
    
    let carRepairCardDict: NSDictionary = [
        "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
        "id": "2f50bbfae132abbb07fa184cb826e1d29555cb53",
        "name": "Moses & Sons Smash Repairs",
        "place_id": "ChIJDSR7MTGuEmsR9-82GmIk__E",
        "rating": 5,
        "vicinity": "192 Harris Street, Pyrmont",
        "geometry": ["location": [ "lat": -33.87054500000001, "lng": 151.194722] ]
    ]
    
    let reviewDict: NSDictionary = [
        "author_name": "Tremar Prendergast",
        "author_url": "https://www.google.com/maps/contrib/116179720699577130416/reviews",
        "language": "en",
        "profile_photo_url": "https://lh3.googleusercontent.com/-jSkW7yNlS7Q/AAAAAAAAAAI/AAAAAAAAACg/m4a5xmR5v1s/s128-c0x00000000-cc-rp-mo/photo.jpg",
        "rating": 5,
        "relative_time_description": "2 years ago",
        "text": "These guys did a fantastic job of repairing the damage to my front bumper for a very reasonable price. Friendly service too."
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCarRepairCollection() {
        let json: NSDictionary = ["results" : [carRepairCardDict]]
        let response = CarRepairCollection.from(json)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.collection.count, 1)
    }
    
    func testCairRepairCard() {
        let response = CarRepairCard.from(carRepairCardDict)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.icon, URL(string: "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"))
        XCTAssertEqual(response?.id, "2f50bbfae132abbb07fa184cb826e1d29555cb53")
        XCTAssertEqual(response?.name, "Moses & Sons Smash Repairs")
        XCTAssertEqual(response?.rating, 5)
        XCTAssertEqual(response?.vicinity, "192 Harris Street, Pyrmont")
    }
    
    func testCardRepair() {
        let response = CarRepair.from(carRepairDict)
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
        let response = Review.from(reviewDict)
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
