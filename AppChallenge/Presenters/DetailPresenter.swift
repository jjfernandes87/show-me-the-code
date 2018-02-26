//
//  DetailPresenter.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class DetailPresenter: NSObject {
    
    weak var viewProtocol: DetailController?
    
    var service = PlacesInteractor()
    var placeId: String
    var number = ""
    
    init(id: String) {
        placeId = id
        super.init()
    }
    
}

extension DetailPresenter: ViewControllerProtocols {
    
    func viewDidLoad() {}
    
    /// download detail data
    func downloadData() {
        service.loadDetail(placeId: placeId) { (success, errorMessage, result, noInternet) in
            if noInternet { self.viewProtocol?.applyNetwork(); return }
            guard let data = result else { self.viewProtocol?.applyExceptionView(); return }
            DispatchQueue.main.async { self.updateUI(data: data) }
        }
    }
    
    /// Update ui
    ///
    /// - Parameter data: car repair
    internal func updateUI(data: CarRepair) {
        guard let controller = viewProtocol else { return }
        controller.title = data.name
        controller.tableView.rows = loadCells(data: data)
        controller.applyPresentingView()
    }
    
    /// Load cells
    ///
    /// - Parameter data: carRepair
    /// - Returns: lists of cells
    internal func loadCells(data: CarRepair) -> [AnyObject] {
        var rows = [AnyObject]()
        rows.append(ReviewAddressCell(head: "Address", description: data.formattedAddress))
        
        if let phone = data.internationalPhoneNumber {
            rows.append(ReviewAddressCell(head: "Phone", description: phone))
        }
        
        rows.append(ReviewAddressCell(head: "Vicinity", description: data.vicinity))
        rows.append(ReviewRatingsCell(card: data))
        
        for review in data.reviews {
            if let text = review.text, text.count > 0 {
                rows.append(ReviewTextCell(review: review))
            }
        }
        
        return rows
    }

}
