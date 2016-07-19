//
//  NotifTableViewCell.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class NotifTableViewCell: UITableViewCell {

    @IBOutlet weak var notifCellTitleLabel: UILabel!
    @IBOutlet weak var notifCellDateLabel: UILabel!
    @IBOutlet weak var notifCellContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
