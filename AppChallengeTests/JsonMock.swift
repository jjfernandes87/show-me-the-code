//
//  JsonMock.swift
//  AppChallengeTests
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import XCTest

struct JsonMock {
    
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
}
