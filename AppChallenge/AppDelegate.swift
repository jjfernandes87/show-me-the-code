//
//  AppDelegate.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import LaunchApplication

var mainRouter: MainRouter?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var launchSequence = LaunchApp()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        launchSequence.launchWithDelegate(delegate: self)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        mainRouter = MainRouter(window: window)
        mainRouter!.launch()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        Geoloc.shared.stopLocationRequests()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        Geoloc.shared.stopLocationRequests()
    }
    
}

extension AppDelegate: LaunchApplicationProtocol {
    func didFinishLaunchSequence(application: LaunchApplication) {
        Geoloc.shared.startLocationRequest()
    }
}
