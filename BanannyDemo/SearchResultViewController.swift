//
//  SearchResultViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTableView: UITableView!
    
    let customCellIdentifier = "SearchResultTableViewCell"
    
    var searchResults:[searchResult] = [
        searchResult(nameResult: "Sadness", imageResult: "profile_1", starResult: 4, numResult: "(90)", hourResult: "$500/hr", finishResult: "90", startDay: "2016/08/03", introClasses: [introClass(introClassTitle: "平日每小時收費", introClassContent: "500/hr"), introClass(introClassTitle: "六日及國定假日每小時收費", introClassContent: "500/hr"), introClass(introClassTitle: "特殊時段每小時加收費", introClassContent: "500/hr"), introClass(introClassTitle: "特殊時段備註", introClassContent: "24小時"), introClass(introClassTitle: "每趟最低時限", introClassContent: "6小時"), introClass(introClassTitle: "托育經驗起始日", introClassContent: "2016/08/03"), introClass(introClassTitle: "特殊托育經驗", introClassContent: "我有帶過自閉症兒童，過動兒"), introClass(introClassTitle: "自我介紹", introClassContent: "親愛的爸爸媽媽你們好，我有過十年的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中，希望有機會合作。"), introClass(introClassTitle: "托育人員登記號碼", introClassContent: "123456"), introClass(introClassTitle: "完成托育案件次數", introClassContent: "90")]),
        searchResult(nameResult: "Miss Disgust", imageResult: "profile_2", starResult: 4.5, numResult: "(50)", hourResult: "$500/hr", finishResult: "90", startDay: "2016/08/03", introClasses: [introClass(introClassTitle: "平日每小時收費", introClassContent: "500/hr"), introClass(introClassTitle: "六日及國定假日每小時收費", introClassContent: "500/hr"), introClass(introClassTitle: "特殊時段每小時加收費", introClassContent: "500/hr"), introClass(introClassTitle: "特殊時段備註", introClassContent: "24小時"), introClass(introClassTitle: "每趟最低時限", introClassContent: "6小時"), introClass(introClassTitle: "托育經驗起始日", introClassContent: "2016/08/03"), introClass(introClassTitle: "特殊托育經驗", introClassContent: "我有帶過自閉症兒童，過動兒"), introClass(introClassTitle: "自我介紹", introClassContent: "親愛的爸爸媽媽你們好，我有過十年的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中，希望有機會合作。"), introClass(introClassTitle: "托育人員登記號碼", introClassContent: "123456"), introClass(introClassTitle: "完成托育案件次數", introClassContent: "90")]),
        searchResult(nameResult: "Anger", imageResult: "profile_3", starResult: 5, numResult: "(40)", hourResult: "$500/hr", finishResult: "90", startDay: "2016/08/03", introClasses: [introClass(introClassTitle: "平日每小時收費", introClassContent: "500/hr"), introClass(introClassTitle: "六日及國定假日每小時收費", introClassContent: "500/hr"), introClass(introClassTitle: "特殊時段每小時加收費", introClassContent: "500/hr"), introClass(introClassTitle: "特殊時段備註", introClassContent: "24小時"), introClass(introClassTitle: "每趟最低時限", introClassContent: "6小時"), introClass(introClassTitle: "托育經驗起始日", introClassContent: "2016/08/03"), introClass(introClassTitle: "特殊托育經驗", introClassContent: "我有帶過自閉症兒童，過動兒"), introClass(introClassTitle: "自我介紹", introClassContent: "親愛的爸爸媽媽你們好，我有過十年的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中，希望有機會合作。"), introClass(introClassTitle: "托育人員登記號碼", introClassContent: "123456"), introClass(introClassTitle: "完成托育案件次數", introClassContent: "90")])
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.grayColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.grayColor()]
        
        self.title = "搜尋"

        
        // searchTableView and customCell
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.estimatedRowHeight = 180
        searchTableView.rowHeight = UITableViewAutomaticDimension
        searchTableView.registerNib(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        
        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        if let index = searchTableView.indexPathForSelectedRow{
//            searchTableView.deselectRowAtIndexPath(index, animated: true)
//        }
//    }

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
        cell.ResultHourlyNum.text = searchResults[indexPath.row].hourRseult
        cell.ResultFinishedNum.text = searchResults[indexPath.row].finishResult
        cell.ResultStartNum.text = searchResults[indexPath.row].startDay
        cell.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        

        
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
 
}
