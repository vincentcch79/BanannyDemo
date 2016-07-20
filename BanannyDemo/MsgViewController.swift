//
//  MsgViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/20.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class MsgViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var msgTableView: UITableView!
    
    let customCellIdentifier = "MsgCustomTableViewCell"
    
    var msgCustomCells: [MsgViewClass] = [
        MsgViewClass(msgImage: "logo", msgTitle: "Bananny官方訊息", msgDate: "2016/08/03", msgContent: "你好請幫我克服這個問題，我看不到這個保姆的資料..."),
        MsgViewClass(msgImage: "profile_1", msgTitle: "王保姆", msgDate: "2016/08/03", msgContent: "你好，我想請問你的托育經驗..."),
        MsgViewClass(msgImage: "profile_2", msgTitle: "張保姆", msgDate: "2016/07/02", msgContent: "你好，我家小孩有一些比較需要注意的狀況..."),
        MsgViewClass(msgImage: "profile_3", msgTitle: "李保姆", msgDate: "2016/06/25", msgContent: "請問上次溝通的時間還可以嗎？ ...")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationBar setting
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.grayColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.grayColor()]
        self.title = "訊息"
        // tableview setting
        msgTableView.delegate = self
        msgTableView.dataSource = self
        msgTableView.estimatedRowHeight = 150
        msgTableView.rowHeight = UITableViewAutomaticDimension
        msgTableView.registerNib(UINib(nibName: "MsgCustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableview datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgCustomCells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MsgCustomTableViewCell", forIndexPath: indexPath) as! MsgCustomTableViewCell
        cell.msgImageView.image = UIImage(named: msgCustomCells[indexPath.row].msgImage)
        cell.msgTitleLabel.text = msgCustomCells[indexPath.row].msgTitle
        cell.msgDateLabel.text = msgCustomCells[indexPath.row].msgDate
        cell.msgContentLabel.text = msgCustomCells[indexPath.row].msgContent
        
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

}
