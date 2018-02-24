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
 
    let key = "AIzaSyCxmDvGnuO7NXfGt-DiviuxOZOwYDgnqPc"
    
    /// Load listing in Google Maps Web service
    ///
    /// - Parameter completion: result data
    func loadListing(completion: @escaping ((Bool, String?, [CarRepair]?) -> Void)) {
        
        let url = pathURL(tag: "listing")
        let parameters : [String : Any]  = ["location" : "-33.8670,151.1957", "radius": 500, "types": "car_repair", "key": key]
        
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
    func loadDetail(completion: @escaping ((Bool, String?, CarRepair?) -> Void)) {
        
        let url = pathURL(tag: "detail")
        let parameters : [String : Any]  = ["placeid" : "ChIJDSR7MTGuEmsR9-82GmIk__E", "key": key]
        
        let config = RequestConfig(url: url, method: .get, parameters: parameters)
        ServiceAPI.request(config: config, success: { (result) in
            guard let json = result else { return completion(false, "Parse error", nil) }
            print("json: \(json)")
            completion(true, nil, nil)
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
    
}
