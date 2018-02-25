//
//  UIBaseViewController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 22/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

var preloadedLoadingXib: UINib!
var preloadedExceptionsXib: UINib!
var preloadedNetworkXib: UINib!

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
    
    let networkStatus = NetworkStatus.sharedInstance
    var viewStatus: UIBaseViewStatus?
    
    //MARK: - Outlet
    @IBOutlet weak var uiLoadingView: UIView?
    @IBOutlet weak var uiExceptionsView: UIView?
    @IBOutlet weak var uiExceptionsNetworkView: UIView?
    @IBOutlet weak var uiMissResultView: UIView?
    
    deinit {
        print(description)
        NotificationCenter.default.removeObserver(self, name: .notReachable, object: nil)
        NotificationCenter.default.removeObserver(self, name: .reachable, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingAndErrorView()
        networkStatus.startNetworkReachabilityObserver()
        tryDownloadingOnOccasion(occasion: .viewDidLoad)
        NotificationCenter.default.addObserver(self, selector: #selector(notReachable), name: .notReachable, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reachable), name: .reachable, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tryDownloadingOnOccasion(occasion: .viewDidAppear)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLoadingAndErrorView()
        tryDownloadingOnOccasion(occasion: .viewWillAppear)
    }
    
    func downloadData(viewOccasion: DownloadOccasion) -> Bool {
        return false
    }
    
    @IBAction func retry(sender: UIButton) {
        tryDownloadingOnOccasion(occasion: .retry)
    }
    
    fileprivate func setupLoadingAndErrorView() {
        var statusViews = [UIView]()
        
        if uiLoadingView == nil {
            preloadedLoadingXib.instantiate(withOwner: self, options: nil)
            if let loading = uiLoadingView {
                statusViews.append(loading)
            }
        }
        
        if uiExceptionsView == nil {
            preloadedExceptionsXib.instantiate(withOwner: self, options: nil)
            if let error = uiExceptionsView {
                statusViews.append(error)
            }
        }
        
        if uiExceptionsNetworkView == nil {
            preloadedNetworkXib.instantiate(withOwner: self, options: nil)
            if let network = uiExceptionsNetworkView {
                statusViews.append(network)
            }
        }
        
        
        for statusView in statusViews {
            if statusView.superview == nil {
                self.view.addSubview(statusView)
                statusView.frame = self.view.frame
                statusView.clipsToBounds = true
                statusView.alpha = 0.0
                statusView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                statusView.setNeedsDisplay()
            }
        }
    }
}

// MARK: - Download occasion
extension UIBaseViewController {
    fileprivate func tryDownloadingOnOccasion(occasion: DownloadOccasion) {
        if downloadData(viewOccasion: occasion) { setViewStatus(status: .loading, animated: false) }
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
                setNetworkActivity(visible: true)
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
            setNetworkActivity(visible: false)
            if uiExceptionsView != nil && uiLoadingView != nil {
                uiLoadingView?.alpha = 0.0
                uiExceptionsView?.alpha = 0.0
                uiExceptionsNetworkView?.alpha = 0.0
                uiMissResultView?.alpha = 0.0
            }
        }
        
        if(animated) { UIView.commitAnimations() }
    }
    
    private func setNetworkActivity(visible: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible  = visible
    }
    
    @objc fileprivate func notReachable() {
        setViewStatus(status: .network)
    }
    
    @objc fileprivate func reachable() {
        setLastViewStatus()
        tryDownloadingOnOccasion(occasion: .retry)
    }
}
