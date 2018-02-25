//
//  ReviewAddressCell.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(ReviewAddressCell)
class ReviewAddressCell: CellController {
    
    private(set) var title: String
    private(set) var descriptionText: String
    
    required init(head: String, description: String) {
        title = head
        descriptionText = description
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! ReviewAddressCellView
        cell.head.text = title
        cell.address.text = descriptionText
        return cell
    }
}

class ReviewAddressCellView: CellView {
    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var address: UILabel!
}

