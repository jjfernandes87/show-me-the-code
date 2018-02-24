//
//  Review.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Mapper

struct Review: Mappable {
    
    let authorName: String
    let authorUrl: URL
    let language: String
    let profilePhotoUrl: URL
    let rating: Int
    let relativeTimeDescription: String
    let text: String
    
    init(map: Mapper) throws {
        try authorName = map.from("author_name")
        try authorUrl = map.from("author_url")
        try language = map.from("language")
        try profilePhotoUrl = map.from("profile_photo_url")
        try rating = map.from("rating")
        try relativeTimeDescription = map.from("relative_time_description")
        try text = map.from("text")
    }
}

