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
    
    init(id: String) {
        placeId = id
        super.init()
    }
}

extension DetailPresenter: ViewControllerProtocols {
    
    func viewDidLoad() {
        //TODO
    }
    
    /// download detail data
    func downloadData() {
        service.loadDetail(placeId: placeId) { (success, errorMessage, result) in
            print(errorMessage ?? "sucesso")
        }
    }
    
}
