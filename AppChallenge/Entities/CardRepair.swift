//
//  CardRepair.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper

struct CarRepairDetail: Mappable {
    let result: CarRepair
    init(map: Mapper) throws {
        try result = map.from("result")
    }
}

class CarRepair: CarRepairCard {
    
    let formattedAddress: String
    let formattedPhoneNumber: String?
    let internationalPhoneNumber: String?
    let url: URL
    let reviews: [Review]
    
    required init(map: Mapper) throws {
        reviews = map.optionalFrom("reviews") ?? []
        formattedPhoneNumber = map.optionalFrom("formatted_phone_number")
        internationalPhoneNumber = map.optionalFrom("international_phone_number")
        
        try formattedAddress = map.from("formatted_address")
        try url = map.from("url")
        try super.init(map: map)
    }
}
