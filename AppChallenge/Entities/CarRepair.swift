//
//  CarRepair.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper
import CoreLocation

struct CarRepairCollection: Mappable {
    let collection: [CarRepair]
    init(map: Mapper) throws {
        collection = map.optionalFrom("results") ?? []
    }
}

struct CarRepair: Mappable {
    
    let icon: URL
    let id: String
    let placeId: String
    let name: String
    let rating: Int
    let vicinity: String
    let location: CLLocationCoordinate2D
    
    init(map: Mapper) throws {
        try icon = map.from("icon", transformation: extractURL)
        try id = map.from("id")
        try placeId = map.from("place_id")
        try name = map.from("name")
        try rating = map.from("rating")
        try vicinity = map.from("vicinity")
        try location = map.from("geometry.location")
    }
}

func extractURL(object: Any?) throws -> URL {
    guard let path = object as? String else { throw MapperError.convertibleError(value: object, type: String.self) }
    if let pathURL = URL(string: path) { return pathURL }
    throw MapperError.customError(field: nil, message: "Couldn't create a url")
}
