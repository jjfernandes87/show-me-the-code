//
//  ReviewTextCell.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Nuke

@objc(ReviewTextCell)
class ReviewTextCell: CellController {
    
    private(set) var data: Review
    
    required init(review: Review) {
        data = review
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! ReviewTextCellView
        Manager.shared.loadImage(with: data.profilePhotoUrl, into: cell.icon)
        cell.authorName.text = data.authorName
        cell.authorDescription.text = data.text
        return cell
    }
}

class ReviewTextCellView: CellView {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorDescription: UILabel!
    
}

