//
//  CarRepairCard.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper
import CoreLocation

struct CarRepairCollection: Mappable {
    let collection: [CarRepairCard]
    init(map: Mapper) throws {
        collection = map.optionalFrom("results") ?? []
    }
}

class CarRepairCard: Mappable {
    
    let icon: URL
    let id: String
    let placeId: String
    let name: String
    let rating: Float?
    let vicinity: String
    let location: CLLocationCoordinate2D
    
    required init(map: Mapper) throws {
        try icon = map.from("icon")
        try id = map.from("id")
        try placeId = map.from("place_id")
        try name = map.from("name")
        try vicinity = map.from("vicinity")
        try location = map.from("geometry.location")
        rating = map.optionalFrom("rating")
    }
}
