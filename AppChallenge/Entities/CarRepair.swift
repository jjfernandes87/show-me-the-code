//
//  CarRepair.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper

struct CarRepairCollection: Mappable {
    let collection: [CarRepair]
    init(map: Mapper) throws {
        collection = map.optionalFrom("results") ?? []
    }
}

struct CarRepair: Mappable {
    
    var icon: URL?
    var id: String
    var name: String
    var rating: Int
    var vicinity: String
    
    init(map: Mapper) throws {
        icon = map.optionalFrom("icon", transformation: extractURL)
        id = try map.from("id")
        name = try map.from("name")
        rating = try map.from("rating")
        vicinity = try map.from("vicinity")
    }
}

func extractURL(object: Any?) throws -> URL {
    guard let path = object as? String else { throw MapperError.convertibleError(value: object, type: String.self) }
    if let pathURL = URL(string: path) { return pathURL }
    throw MapperError.customError(field: nil, message: "Couldn't split the string!")
}
