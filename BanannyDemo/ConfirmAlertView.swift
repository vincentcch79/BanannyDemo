//
//  ConfirmAlertView.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class ConfirmAlertView: UIView {

    @IBOutlet weak var confirmLabel: UILabel!
    
    @IBAction func confirmButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.confirmHandler == nil {
                return
            }
            self.confirmHandler!()
        }
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.maxY)
            self.layer.opacity = 0
        }) { (_) -> Void in
            if self.cancelHandler == nil {
                return
            }
            self.cancelHandler!()
        }
    }
    
    private var cancelHandler: (() -> Void)?
    private var confirmHandler: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.midY)
        
    }
    
    func setActionHandler(actionType: String, handler: () -> Void) {
        
        if actionType == "cancel" {
            cancelHandler = handler
        }else if actionType == "OK" {
            confirmHandler = handler
        }
    }

    
    
}
