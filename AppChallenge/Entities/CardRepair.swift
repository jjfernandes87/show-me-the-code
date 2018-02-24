//
//  CardRepair.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper

class CarRepair: CarRepairCard {
    
    let formattedAddress: String
    let formattedPhoneNumber: String
    let internationalPhoneNumber: String
    let url: URL
    let reviews: [Review]
    
    required init(map: Mapper) throws {
        reviews = map.optionalFrom("reviews") ?? []
        
        try formattedAddress = map.from("formatted_address")
        try formattedPhoneNumber = map.from("formatted_phone_number")
        try internationalPhoneNumber = map.from("international_phone_number")
        try url = map.from("url")
        try super.init(map: map)
    }
}
