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
    
    var service = (interactor: PlacesInteractor(), result: [CarRepairCard]() )
}

// MARK: - ViewControllerProtocols methods
extension ListingPresenter: ViewControllerProtocols {
    
    /// setup presenter
    func viewDidLoad() {
        onboarding()
        guard let controller = viewProtocol else { return }
        controller.tableView.rowHeight = UITableViewAutomaticDimension
        controller.tableView.estimatedRowHeight = 100
        controller.tableView.dataSource = self
        controller.tableView.delegate = self
    }
    
    fileprivate func onboarding() {
        router?.showOnBoarding()
    }
    
    /// download listing data
    func downloadData() {
        service.interactor.loadListing { (success, errorMessage, result)  in
            if success == false { self.viewProtocol?.applyExceptionView(); return }
            if result?.count == 0 { self.viewProtocol?.applyZeroResultView(); return }
            self.reloadData(result: result)
        }
    }
    
    /// Update interface
    internal func reloadData(result: [CarRepairCard]?) {
        service.result = result ?? [CarRepairCard]()
        self.viewProtocol?.applyPresentingView()
    }
    
}

// MARK: - UITableViewDataSource methods
extension ListingPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.setContent(card: service.result[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate methods
extension ListingPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showDetail(placeId: service.result[indexPath.row].placeId)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
