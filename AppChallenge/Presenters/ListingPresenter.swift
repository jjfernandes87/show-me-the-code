//
//  ListingPresenter.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class ListingPresenter: NSObject {
    
    weak var viewProtocol: ListingController?
    var router: ListingRouter?
    
    var service = (interactor: PlacesInteractor(), result: [CarRepair]() )
}

// MARK: - ViewControllerProtocols methods
extension ListingPresenter: ViewControllerProtocols {
    
    func viewDidLoad() {
        guard let controller = viewProtocol else { return }
        controller.tableView.dataSource = self
        controller.tableView.delegate = self
    }
    
    /// download listing data
    func downloadData() {
        service.interactor.loadListing { (success, errorMessage, result)  in
            if success == false { self.viewProtocol?.applyExceptionView() }
            if result?.count == 0 { self.viewProtocol?.applyZeroResultView() }
            self.reloadData(result: result)
        }
    }
    
    /// Update interface
    internal func reloadData(result: [CarRepair]?) {
        service.result = result ?? [CarRepair]()
        self.viewProtocol?.applyPresentingView()
    }
    
}

// MARK: - UITableViewDataSource methods
extension ListingPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = service.result[indexPath.row].name
        return cell
    }
    
}

// MARK: - UITableViewDelegate methods
extension ListingPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showDetail()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
