//
//  SearchResultViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchProfileImageView: UIImageView!
    @IBOutlet weak var searchTableView: UITableView!
    
    let customCellIdentifier = "SearchResultTableViewCell"
    
    var searchResults:[searchResult] = [
        searchResult(nameResult: "Sadness", imageResult: "profile_1", starResult: 4, numResult: "(90)", detailIntro: ""),
        searchResult(nameResult: "Miss Disgust", imageResult: "profile_2", starResult: 4.5, numResult: "(50)", detailIntro: ""),
        searchResult(nameResult: "Anger", imageResult: "profile_3", starResult: 5, numResult: "(40)", detailIntro: "")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // searchTableView and customCell
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.estimatedRowHeight = 180
        searchTableView.rowHeight = UITableViewAutomaticDimension
        searchTableView.registerNib(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultTableViewCell", forIndexPath: indexPath) as! SearchResultTableViewCell
        
        cell.ResultNameLabel.text = searchResults[indexPath.row].nameResult
        cell.ResultCellImageView.image = UIImage(named: searchResults[indexPath.row].imageResult)
        cell.ResultStarRating.rating = searchResults[indexPath.row].starResult
        
        
        return cell
    }

    // MARK: - perform Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailResultSegue"{
            
            if let indexPath = searchTableView.indexPathForSelectedRow{
                let destinationViewController = segue.destinationViewController as! SearchDetailViewController
                destinationViewController.searchDetail = searchResults[indexPath.row]
            }
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("detailResultSegue", sender: searchResults[indexPath.row])
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backToDashButton(sender: AnyObject) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ParentDashboardViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("parentDashView")
        self.presentViewController(ParentDashboardViewController, animated: true, completion: nil)

    }

}
