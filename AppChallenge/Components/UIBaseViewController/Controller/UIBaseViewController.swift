//
//  UIBaseViewController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

enum DownloadOccasion: Int {
    case viewDidLoad
    case viewWillAppear
    case viewDidAppear
    case retry
    case backFromBackground
}

enum UIBaseViewStatus: Int {
    case unknown
    case loading
    case presenting
    case exceptions
    case network
    case missResult
}

class UIBaseViewController: UIViewController {
    
    var viewStatus: UIBaseViewStatus?
    
    //MARK: - Outlet
    @IBOutlet weak var uiLoadingView: UIView?
    @IBOutlet weak var uiExceptionsView: UIView?
    @IBOutlet weak var uiExceptionsNetworkView: UIView?
    @IBOutlet weak var uiMissResultView: UIView?
    
    deinit { print(description) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tryDownloadingOnOccasion(occasion: .viewDidLoad)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tryDownloadingOnOccasion(occasion: .viewDidAppear)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tryDownloadingOnOccasion(occasion: .viewWillAppear)
    }
    
    @IBAction func retry(sender: UIButton) {
        tryDownloadingOnOccasion(occasion: .retry)
    }
    
}

// MARK: - Download occasion
extension UIBaseViewController {
    fileprivate func tryDownloadingOnOccasion(occasion: DownloadOccasion) {
        if downloadData(viewOccasion: occasion) { setViewStatus(status: .loading, animated: false) }
    }
    
    func downloadData(viewOccasion: DownloadOccasion) -> Bool {
        return false
    }
}

// MARK: - ViewStatus
extension UIBaseViewController {
    func setLastViewStatus() {
        setViewStatus(status: viewStatus ?? .presenting)
    }
    
    func setViewStatus(status: UIBaseViewStatus) {
        setViewStatus(status: status, animated: false)
    }
    
    func setViewStatus(status: UIBaseViewStatus, animated: Bool) {
        
        if status != .network { viewStatus = status }
        
        if animated { UIView.beginAnimations("UIBaseViewStatus", context: nil) }
        
        uiLoadingView?.alpha = 0.0
        uiExceptionsView?.alpha = 0.0
        uiMissResultView?.alpha = 0.0
        
        if status == .exceptions {
            if let error = uiExceptionsView {
                view.bringSubview(toFront: error)
                error.alpha = 1.0
            }
        }
        
        if status == .loading {
            if let loading = uiLoadingView {
                view.bringSubview(toFront: loading)
                loading.alpha = 1.0
            }
        }
        
        if status == .network {
            if let network = uiExceptionsNetworkView {
                view.bringSubview(toFront: network)
                network.alpha = 1.0
            }
        }
        
        if status == .missResult {
            if let missResult = uiMissResultView {
                view.bringSubview(toFront: missResult)
                missResult.alpha = 1.0
            }
        }
        
        if status == .presenting {
            if uiExceptionsView != nil && uiLoadingView != nil {
                uiLoadingView?.alpha = 0.0
                uiExceptionsView?.alpha = 0.0
                uiExceptionsNetworkView?.alpha = 0.0
                uiMissResultView?.alpha = 0.0
            }
        }
        
        if(animated) { UIView.commitAnimations() }
    }
}
