//
//  MainRouter.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

protocol ListingRouter {
    func showDetail()
}

class MainRouter: UINavigationController {
    
    var window: UIWindow?
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
    }
    
    /// Launch navigation with car repair listing
    func launch() {
        viewControllers = [loadListing()]
        window?.rootViewController = self
    }
    
}

// MARK: - Listing methods
extension MainRouter {
    fileprivate func loadListing() -> UIViewController {
        
        let presenter = ListingPresenter()
        let controller = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        controller.presenter = presenter
        presenter.viewProtocol = controller
        presenter.router = self
        
        return controller
    }
}

// MARK: - DetailRouter methods
extension MainRouter: ListingRouter {
    
    func showDetail() {
        let controller = loadDetail()
        pushViewController(controller, animated: true)
    }
    
    fileprivate func loadDetail() -> UIViewController {
        let controller = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return controller
    }
    
}
