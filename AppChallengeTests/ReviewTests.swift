//
//  ReviewTests.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest
@testable import AppChallenge

class ReviewTests: XCTestCase {
    
    let reviewDict: NSDictionary = [
        "author_name": "Tremar",
        "author_url": "https://www.google.com/maps/contrib/116179720699577130416/reviews",
        "language": "en",
        "profile_photo_url": "https://lh3.googleusercontent.com/-jSkW7yNlS7Q/AAAAAAAAAAI/AAAAAAAAACg/m4a5xmR5v1s/s128-c0x00000000-cc-rp-mo/photo.jpg",
        "rating": 5,
        "relative_time_description": "2 years ago",
        "text": "These guys"
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReview() {
        let response = Review.from(reviewDict)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.authorName, "Tremar")
        XCTAssertEqual(response?.language, "en")
        XCTAssertEqual(response?.rating, 5)
        XCTAssertEqual(response?.relativeTimeDescription, "2 years ago")
        XCTAssertEqual(response?.text, "These guys")
    }
    
}
