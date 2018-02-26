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
        cell.fiveStarsView.progress = 1
        cell.fourStarsView.progress = 0.8
        cell.threeStarsView.progress = 0.6
        cell.twoStarsView.progress = 0.4
        cell.oneStarsView.progress = 0.2
        return cell
    }
}

class ReviewRatingsCellView: CellView {
    @IBOutlet weak var ratingValue: UILabel!
    @IBOutlet weak var fiveStarsView: UIProgressView!
    @IBOutlet weak var fourStarsView: UIProgressView!
    @IBOutlet weak var threeStarsView: UIProgressView!
    @IBOutlet weak var twoStarsView: UIProgressView!
    @IBOutlet weak var oneStarsView: UIProgressView!
}
