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
        cell.fiveStarsView.setProgress(average(star: 5), animated: true)
        cell.fourStarsView.setProgress(average(star: 4), animated: true)
        cell.threeStarsView.setProgress(average(star: 3), animated: true)
        cell.twoStarsView.setProgress(average(star: 2), animated: true)
        cell.oneStarsView.setProgress(average(star: 1), animated: true)
        return cell
    }
    
    func average(star: Int) -> Float {
        let count = data.reviews.count
        let startCount = data.reviews.filter({ Int($0.rating ?? 0)  == star }).count
        return Float(startCount)/Float(count)
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
