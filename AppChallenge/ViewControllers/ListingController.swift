//
//  ListingController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class ListingController: UIBaseViewController {

    var presenter: ViewControllerProtocols!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func downloadData(viewOccasion: DownloadOccasion) -> Bool {
        if viewOccasion == .viewDidLoad {
            presenter.downloadData()
            return true
        }
        return false
    }
    
    /// setViewStatus when result service equal zero
    func applyZeroResultView() {
        setViewStatus(status: .missResult, animated: true)
    }
    
    /// setViewStatus when service conclude with errors
    func applyExceptionView() {
        setViewStatus(status: .exceptions, animated: true)
    }
    
    /// setViewStatus when service conclude status code 200
    func applyPresentingView() {
        tableView.reloadData()
        setViewStatus(status: .presenting, animated: true)
    }
    
}
