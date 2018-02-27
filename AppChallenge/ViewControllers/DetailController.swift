//
//  DetailController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

public class DetailController: UIBaseViewController {
    
    var presenter: ViewControllerProtocols!
    
    @IBOutlet weak var tableView: TableViewManager!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func downloadData(viewOccasion: DownloadOccasion) -> Bool {
        if viewOccasion == .viewDidLoad || viewOccasion == .retry {
            presenter.downloadData()
            return true
        }
        return false
    }
    
    /// setViewStatus when service no internet connection
    public func applyNetwork() {
        setViewStatus(status: .network, animated: true)
    }
    
    /// setViewStatus when service conclude with errors
    public func applyExceptionView() {
        setViewStatus(status: .exceptions, animated: true)
    }
    
    /// setViewStatus when service conclude status code 200
    public func applyPresentingView() {
        setViewStatus(status: .presenting, animated: true)
    }

}
