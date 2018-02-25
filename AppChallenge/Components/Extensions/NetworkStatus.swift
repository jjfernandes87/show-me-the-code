//
//  UIViewController+Helpers.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

class NetworkStatus {
    
    static let sharedInstance = NetworkStatus()
    
    let reachability = NetworkReachabilityManager()
    
    func startNetworkReachabilityObserver() {
        reachability?.listener = { status in
            switch status {
            case .notReachable: self.sendNotification(name: .notReachable)
            case .unknown : self.sendNotification(name: .notReachable)
            case .reachable(.ethernetOrWiFi): self.sendNotification(name: .reachable)
            case .reachable(.wwan): self.sendNotification(name: .reachable)
            }
        }
        reachability?.startListening()
    }
    
    func sendNotification(name: Notification.Name) {
        NotificationCenter.default.post(name: name, object: nil, userInfo: nil)
    }
}

extension Notification.Name {
    static let notReachable = Notification.Name("notReachable")
    static let reachable = Notification.Name("reachable")
}
