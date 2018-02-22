//
//  ViewController.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 21/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presenter: ViewControllerInterfaceProtocols!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func applyZeroResultView() {
        
    }
    
    func applyExceptionView() {
        
    }
    
    func applyWithoutNetwork() {
        
    }
}
