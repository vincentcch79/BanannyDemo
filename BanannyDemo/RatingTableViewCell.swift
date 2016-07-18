//
//  RatingTableViewCell.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/18.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingCellImageView: UIImageView!
    @IBOutlet weak var ratingCellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
