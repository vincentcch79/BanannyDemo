//
//  ParentFirstViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ParentFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transparent NavigationBar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func parentNormalLoginButton(sender: AnyObject) {
    }
    @IBAction func parentFBLoginButton(sender: AnyObject) {
    }
}
