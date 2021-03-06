//
//  ListingController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

public class ListingController: UIBaseViewController {

    var presenter: ViewControllerProtocols!
    
    @IBOutlet weak var tableView: UITableView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func downloadData(viewOccasion: DownloadOccasion) -> Bool {
        if viewOccasion == .viewWillAppear || viewOccasion == .retry {
            presenter.downloadData()
            return true
        }
        return false
    }
    
    /// Receive a new location
    override func receiveLocation() {
        presenter.downloadData()
    }
    
    /// setViewStatus when service no internet connection
    public func applyNetwork() {
        self.setViewStatus(status: .network, animated: true)
    }
    
    /// setViewStatus when result service equal zero
    public func applyZeroResultView() {
        setViewStatus(status: .missResult, animated: true)
    }
    
    /// setViewStatus when service conclude with errors
    public func applyExceptionView() {
        setViewStatus(status: .exceptions, animated: true)
    }
    
    /// setViewStatus when service conclude status code 200
    public func applyPresentingView() {
        tableView.reloadData()
        setViewStatus(status: .presenting, animated: true)
    }
    
}
