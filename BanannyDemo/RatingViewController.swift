//
//  RatingViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/18.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ratingTableView: UITableView!
    
    let customCellIdentifier = "RatingTableViewCell"
    
    var ratingMembers: [RatingMember] = [
    RatingMember(ratingNannyImage: "profile_1", ratingNannyLabel: "尚未評價Sadness"),
    RatingMember(ratingNannyImage: "profile_2", ratingNannyLabel: "尚未評價Miss Disgust"),
    RatingMember(ratingNannyImage: "profile_3", ratingNannyLabel: "尚未評價Anger")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //ratingTableViewCell
        ratingTableView.delegate = self
        ratingTableView.dataSource = self
        ratingTableView.estimatedRowHeight = 90
        ratingTableView.rowHeight = UITableViewAutomaticDimension
        ratingTableView.registerNib(UINib(nibName: "RatingTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        
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
        return ratingMembers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RatingTableViewCell", forIndexPath: indexPath) as! RatingTableViewCell
        cell.ratingCellImageView.image = UIImage(named: ratingMembers[indexPath.row].ratingNannyImage)
        cell.ratingCellLabel.text = ratingMembers[indexPath.row].ratingNannyLabel
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ParentRatingViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("ratingPageView")
        self.presentViewController(ParentRatingViewController, animated: true, completion: nil)

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backToNotifButton(sender: AnyObject) {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let NotifViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("notifView")
            self.presentViewController(NotifViewController, animated: true, completion: nil)
    }
    
    
}
