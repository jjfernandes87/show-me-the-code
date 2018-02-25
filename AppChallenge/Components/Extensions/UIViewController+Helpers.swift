//
//  UIViewController+Helpers.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

extension UIBaseViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let net = NetworkReachabilityManager()
        net?.startListening()
        net?.listener = { status in
            if net?.isReachable ?? false {
                switch status {
                case .reachable(.ethernetOrWiFi): self.setLastViewStatus()
                case .reachable(.wwan): self.setLastViewStatus()
                case .notReachable: self.setViewStatus(status: .network)
                case .unknown : self.setViewStatus(status: .network)
                }
            }
        }
    }
    
}
