//
//  MainRouter.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

protocol ListingRouter {
    func showDetail(placeId: String)
}

struct StoryBoardInfo {
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    func instantiateListingViewController() -> ListingController {
        return mainStoryBoard.instantiateViewController(withIdentifier: "ListingController") as! ListingController
    }
    func instantiateDetailViewController() -> DetailController {
        return mainStoryBoard.instantiateViewController(withIdentifier: "DetailController") as! DetailController
    }
}

class MainRouter: UINavigationController {
    
    var window: UIWindow?
    
    convenience init(window: UIWindow?) {
        self.init()
        self.window = window
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barStyle = .black
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor("#472f91")
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
        let controller = StoryBoardInfo().instantiateListingViewController()
        
        controller.presenter = presenter
        presenter.viewProtocol = controller
        presenter.router = self
        
        return controller
    }
}

// MARK: - DetailRouter methods
extension MainRouter: ListingRouter {
    
    func showDetail(placeId: String) {
        let presenter = DetailPresenter(id: placeId)
        let controller = loadDetail()
        
        controller.presenter = presenter
        presenter.viewProtocol = controller
        
        pushViewController(controller, animated: true)
    }
    
    fileprivate func loadDetail() -> DetailController {
        let controller = StoryBoardInfo().instantiateDetailViewController()
        return controller
    }
    
}
