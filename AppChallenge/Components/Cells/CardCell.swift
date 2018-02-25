//
//  CardCell.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 24/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import Nuke

class CardCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var ratingValue: UILabel!
    @IBOutlet weak var ratingStars: UILabel!
    
    func setContent(card: CarRepairCard) {
        Manager.shared.loadImage(with: card.icon, into: icon)
        
        name.text = card.name
        address.text = card.vicinity
        
        ratingValue.text = String(format:"%.1f", card.rating ?? 0)
        ratingValue.isHidden = card.rating == nil
        ratingValue.textColor = (card.rating ?? 0) > 4 ? .green : .red
        
        var stars = ""
        for _ in 1...Int(card.rating ?? 1) {
            stars += "★"
        }
        
        ratingStars.text = stars
        ratingStars.isHidden = card.rating == nil
        ratingStars.textColor = (card.rating ?? 0) > 4 ? .green : .red
    }
    
}
