//
//  PlacesInteractor.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import ConfigurationProvider

class PlacesInteractor: NSObject {
    
    /// Load listing in Google Maps Web service
    ///
    /// - Parameter completion: result data
    func loadListing(completion: @escaping ((Bool, String?, [CarRepairCard]?) -> Void)) {
        
        let url = pathURL(tag: "listing")
        let parameters : [String : Any]  = ["location" : "-23.6315388,-46.5918594", "radius": 500, "types": "car_repair", "key": apiKey()]
        
        let config = RequestConfig(url: url, method: .get, parameters: parameters)
        ServiceAPI.request(config: config, success: { (result) in
            guard let json = result, let response = CarRepairCollection.from(json) else { return completion(false, "Parse error", nil) }
            completion(true, nil, response.collection)
        }) { (error, errorMessage) in
            completion(false, errorMessage, nil)
        }
        
    }
    
    /// Load detail in Google Maps Web service
    ///
    /// - Parameter completion: result data
    func loadDetail(placeId: String, completion: @escaping ((Bool, String?, CarRepair?) -> Void)) {
        
        let url = pathURL(tag: "detail")
        let parameters : [String : Any]  = ["placeid" : placeId, "key": apiKey()]
        
        let config = RequestConfig(url: url, method: .get, parameters: parameters)
        ServiceAPI.request(config: config, success: { (result) in
            guard let json = result, let response = CarRepairDetail.from(json) else { return completion(false, "Parse error", nil) }
            completion(true, nil, response.result)
        }) { (error, errorMessage) in
            completion(false, errorMessage, nil)
        }
        
    }
    
    /// Get url by tag
    ///
    /// - Parameter tag: configuration.plist > scheme > endpoints > tag
    /// - Returns: path type String
    fileprivate func pathURL(tag: String) -> String {
        return URLConfigurationProvider.urlStringBy(tag: tag)!
    }
    
    /// get google api key
    ///
    /// - Returns: configuration.plist > scheme > googleAPIKEY
    fileprivate func apiKey() -> String {
        return ConfigurationProvider.shared().getBy(tag: "googleAPIKEY")!
    }
    
}
