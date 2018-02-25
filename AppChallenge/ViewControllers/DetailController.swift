//
//  DetailController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class DetailController: UIBaseViewController {
    
    var presenter: ViewControllerProtocols!
    
    @IBOutlet weak var tableView: TableViewManager!
    
    override func viewDidLoad() {
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
    
    /// setViewStatus when service conclude with errors
    func applyExceptionView() {
        setViewStatus(status: .exceptions, animated: true)
    }
    
    /// setViewStatus when service conclude status code 200
    func applyPresentingView() {
        setViewStatus(status: .presenting, animated: true)
    }

}
