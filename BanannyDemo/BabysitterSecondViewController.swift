//
//  BabysitterSecondViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class BabysitterSecondViewController: UIViewController {

    @IBOutlet weak var babysitterPWTextField: UITextField!
    @IBOutlet weak var babysitterEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func babysitterLoginButton(sender: AnyObject) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let babtsitterDashboardViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("babysitterDashView")
        self.presentViewController(babtsitterDashboardViewController, animated: true, completion: nil)

    }

}
