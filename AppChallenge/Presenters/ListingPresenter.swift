//
//  ListingPresenter.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class ListingPresenter: NSObject {
    
    weak var viewProtocol: ViewController?
    var router: ListingRouter?
    
}

// MARK: - ViewControllerInterfaceProtocols methods
extension ListingPresenter: ViewControllerInterfaceProtocols {
    
    func viewDidLoad() {
        guard let controller = viewProtocol else { return }
        controller.tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource methods
extension ListingPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
