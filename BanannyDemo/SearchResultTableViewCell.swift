//
//  SearchResultTableViewCell.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Cosmos


class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var ResultCellImageView: UIImageView!
    @IBOutlet weak var ResultNameLabel: UILabel!
    @IBOutlet weak var ResultStarRating: CosmosView!
    @IBOutlet weak var ResultHourlyNum: UILabel!
    @IBOutlet weak var ResultFinishedNum: UILabel!
    @IBOutlet weak var ResultStartNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
