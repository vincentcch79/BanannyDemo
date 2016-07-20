//
//  BookConfirmViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/19.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class BookConfirmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var confirmTableView: UITableView!
    
    let customCellIdentifier = "ConfirmTableViewCell"
    
    var confirmDetail:[FirstIntro] = [
    FirstIntro(introTitle: "托育日期", introContent: "6月7日"),
    FirstIntro(introTitle: "托育時間", introContent: "14:00 - 19:00(5hr)"),
    FirstIntro(introTitle: "每小時收費", introContent: "500/hr"),
    FirstIntro(introTitle: "總金額", introContent: "$2500"),
    FirstIntro(introTitle: "托育地址", introContent: "新北市淡水區中正東路二段100巷3號"),
    FirstIntro(introTitle: "備註", introContent: "我家小孩很愛流口水")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "預約確認"
        
        //confirmTableView
        confirmTableView.delegate = self
        confirmTableView.dataSource = self
        confirmTableView.estimatedRowHeight = 80
        confirmTableView.rowHeight = UITableViewAutomaticDimension
        confirmTableView.registerNib(UINib(nibName: "ConfirmTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - confrimTableView datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ConfirmTableViewCell", forIndexPath: indexPath) as! ConfirmTableViewCell
        
        cell.confirmTitle.text = confirmDetail[indexPath.row].introTitle
        cell.confirmContent.text = confirmDetail[indexPath.row].introContent
       
        
        return cell

    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func bookButton(sender: AnyObject) {
        
        self.blurView.hidden = false
        let alertView = NSBundle.mainBundle().loadNibNamed("ConfirmAlertView", owner: nil, options: nil).first as! ConfirmAlertView
        alertView.frame.size = CGSize(width: 300, height: 250)
        alertView.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.height * 0.4)
        self.view.addSubview(alertView)
        
        alertView.setActionHandler("cancel") { () -> Void in
            self.blurView.hidden = true
            alertView.removeFromSuperview()
        }
        alertView.setActionHandler("OK") { () -> Void in
            alertView.removeFromSuperview()
            let secondAlertView = NSBundle.mainBundle().loadNibNamed("ConfirmMsgView", owner: nil, options: nil).first as! ConfirmMsgView
            secondAlertView.frame.size = CGSize(width: 300, height: 380)
            secondAlertView.center = CGPoint(x: UIScreen.mainScreen().bounds.midX, y: UIScreen.mainScreen().bounds.height * 0.4)
            self.view.addSubview(secondAlertView)
            
            secondAlertView.setActionHandler("secondConfirm") { () -> Void in
                self.blurView.hidden = true
                secondAlertView.removeFromSuperview()
                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let DashTabBarViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("DashTabBar")
                self.presentViewController(DashTabBarViewController, animated: true, completion: nil)
                
            }
            
        }

    }

}
