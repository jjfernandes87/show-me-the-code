//
//  ServiceAPI.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

struct RequestConfig {
    var url : String
    var method : HTTPMethod
    var parameters : Parameters? = nil
    var encoding : ParameterEncoding = URLEncoding.default
}

extension RequestConfig {
    
    init(url: String, method: HTTPMethod, parameters : Parameters? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
    }
    
}

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()
    static var isConnectedToInternet : Bool? {
        return self.sharedInstance?.isReachable
    }
}

class ServiceAPI: NSObject {
    
    @discardableResult
    class func request(config: RequestConfig, success: @escaping ((_ result : NSDictionary?) -> Void),
                       failure: @escaping ((_ error : Error?, _ errorMessage: String, _ internet: Bool) -> Void)) -> Request? {
        
        if let hasConnection = Connectivity.isConnectedToInternet, !hasConnection {
            failure(nil, "no internet connection", true)
            return nil
        }
        
        let request = Alamofire.request(config.url, method: config.method, parameters: config.parameters, encoding: config.encoding)
            .responseJSON { (response) in
                switch response.result {
                case .success: success(response.value as? NSDictionary)
                case .failure(let error): failure(error, error.localizedDescription, false)
                }
        }
        
        return request
    }
}
