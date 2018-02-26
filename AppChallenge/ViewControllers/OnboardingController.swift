//
//  OnboardingController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class OnboardingController: UIBaseViewController {
    
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func receiveLocation() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func allow() {
        Geoloc.shared.userLocationRequired()
    }
}
