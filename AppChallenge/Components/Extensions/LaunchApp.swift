//
//  LaunchApp.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 26/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import LaunchApplication

class LaunchApp: LaunchApplication {
    
    @objc func launchAndRelaunchSequence() {
        launchSequence.append("LaunchStage_preloadUI")
        launchSequence.append("LaunchStage_preloadTests")
    }
    
    // preload default UI
    @objc func preloadUI() {
        preloadedExceptionsXib = UINib(nibName: "UIBaseViewController+exceptions", bundle: Bundle.main)
        preloadedLoadingXib = UINib(nibName: "UIBaseViewController+loading", bundle: Bundle.main)
        preloadedNetworkXib = UINib(nibName: "UIBaseViewController+network", bundle: Bundle.main)
        nextLaunchStage()
    }
    
    //UITesting
    @objc func preloadTests() {
        if ProcessInfo.processInfo.arguments.contains("UITesting") { Geoloc.shared.defaultLocation() }
        nextLaunchStage()
    }
}
