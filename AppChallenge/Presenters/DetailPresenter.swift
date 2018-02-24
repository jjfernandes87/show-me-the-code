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
}

extension DetailPresenter: ViewControllerProtocols {
    
    func viewDidLoad() {
        //TODO
    }
    
    /// download detail data
    func downloadData() {
        service.loadDetail { (success, errorMessage, result) in
            print(errorMessage ?? "sucesso")
        }
    }
    
}
