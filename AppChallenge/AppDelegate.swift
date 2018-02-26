//
//  AppDelegate.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

var mainRouter: MainRouter?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //UITesting
        if ProcessInfo.processInfo.arguments.contains("UITesting") { Geoloc.shared.defaultLocation() }
        
        preloadedExceptionsXib = UINib(nibName: "UIBaseViewController+exceptions", bundle: Bundle.main)
        preloadedLoadingXib = UINib(nibName: "UIBaseViewController+loading", bundle: Bundle.main)
        preloadedNetworkXib = UINib(nibName: "UIBaseViewController+network", bundle: Bundle.main)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        mainRouter = MainRouter(window: window)
        mainRouter!.launch()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        Geoloc.shared.startLocationRequest()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        Geoloc.shared.stopLocationRequests()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        Geoloc.shared.stopLocationRequests()
    }
    
}

