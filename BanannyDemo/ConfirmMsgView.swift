//
//  ConfirmMsgView.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class ConfirmMsgView: UIView {

    @IBAction func secondConfirm(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.secondConfirmHandler == nil {
                return
            }
            self.secondConfirmHandler!()
        }

    }
    private var secondConfirmHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setActionHandler(actionType: String, handler: () -> Void) {
        
        if actionType == "secondConfirm" {
            secondConfirmHandler = handler
        }
    }
    

}
