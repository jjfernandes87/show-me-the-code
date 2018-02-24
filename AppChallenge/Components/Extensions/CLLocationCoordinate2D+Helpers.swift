//
//  CLLocationCoordinate2D+Helpers.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper
import CoreLocation

extension CLLocationCoordinate2D: Convertible {
    public static func fromMap(_ value: Any) throws -> CLLocationCoordinate2D {
        guard   let location = value as? NSDictionary,
                let latitude = location["lat"] as? Double,
                let longitude = location["lng"] as? Double else {
            throw MapperError.convertibleError(value: value, type: [String: Double].self)
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
