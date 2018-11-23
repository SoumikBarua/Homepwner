//
//  ItemCell.swift
//  Homepwner
//
//  Created by SB on 11/23/18.
//  Copyright © 2018 SB. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    var value: Int! {
        willSet {
            if newValue < 50 {
                valueLabel.textColor = UIColor.green
            } else {
                valueLabel.textColor = UIColor.red
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
