//
//  OnboardingController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class OnboardingController: UIBaseViewController {
    
    class func onboardingComplete() -> String { return "onboardingComplete" }
    
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func receiveLocation() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func allow() {
        onboardingComplete()
        Geoloc.shared.userLocationRequired()
    }
    
    fileprivate func onboardingComplete() {
        UserDefaults.standard.set(true, forKey: OnboardingController.onboardingComplete())
        UserDefaults.standard.synchronize()
    }
}
