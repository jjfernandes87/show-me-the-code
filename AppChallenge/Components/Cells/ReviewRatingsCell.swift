//
//  ReviewRatingsCell.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(ReviewRatingsCell)
class ReviewRatingsCell: CellController {
    
    private(set) var data: CarRepair
    
    required init(card: CarRepair) {
        data = card
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! ReviewRatingsCellView
        cell.ratingValue.text = String(format: "%.1f", data.rating ?? 0)
        return cell
    }
    
}

class ReviewRatingsCellView: CellView {
    @IBOutlet weak var ratingValue: UILabel!
}
