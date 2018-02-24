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

}
