//
//  ListingController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class ListingController: UIBaseViewController {

    var presenter: ViewControllerInterfaceProtocols!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func downloadData(viewOccasion: DownloadOccasion) -> Bool {
        if viewOccasion == .viewDidAppear {
            presenter.downloadData()
            return true
        }
        return false
    }
    
    func applyZeroResultView() {
        setViewStatus(status: .missResult, animated: true)
    }
    
    func applyExceptionView() {
        setViewStatus(status: .exceptions, animated: true)
    }
    
    func applyPresentingView() {
        tableView.reloadData()
        setViewStatus(status: .presenting, animated: true)
    }
    
}
