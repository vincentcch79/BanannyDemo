//
//  NotifViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/16.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class NotifViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notifTableView: UITableView!
    
    let customCellIdentifier = "NotifCustomTableViewCell"
    
    var notifClasses: [NotificationClass] = [
        NotificationClass(notifKind: "Bananny 官方通知", notifDate: "2016/08/03"),
        NotificationClass(notifKind: "評價通知", notifDate: "2016/08/03"),
        NotificationClass(notifKind: "預約通知", notifDate: "2016/08/03")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //notifTableViewCell
        notifTableView.delegate = self
        notifTableView.dataSource = self
        notifTableView.estimatedRowHeight = 100
        notifTableView.rowHeight = UITableViewAutomaticDimension
        notifTableView.registerNib(UINib(nibName: "NotifCustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifClasses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NotifCustomTableViewCell", forIndexPath: indexPath) as! NotifCustomTableViewCell
        
        cell.notifLabel.text = notifClasses[indexPath.row].notifKind
        cell.notifDateLabel.text = notifClasses[indexPath.row].notifDate
        
        
        
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backDashButton(sender: AnyObject) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ParentDashboardViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("parentDashView")
        self.presentViewController(ParentDashboardViewController, animated: true, completion: nil)
    }


}
