//
//  SearchDetailViewController.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/15.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Cosmos
import NoChat

class SearchDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailStarRating: CosmosView!
    @IBOutlet weak var IntroDetailTableView: UITableView!
    
    // TableView Header outlet
    @IBOutlet weak var babysitterIDTitle: UILabel!
    @IBOutlet weak var babysitterIDNumLabel: UILabel!
    @IBOutlet weak var babysitterWeekDayTitle: UILabel!
    @IBOutlet weak var babysitterWeekDayNum: UILabel!
    @IBOutlet weak var babysitterFinishedTitle: UILabel!
    @IBOutlet weak var babysitterFinishedNum: UILabel!
    
    let customCellIdentifier = "SearchDetailTableViewCell"
    let secondCustomCellIdentifier = "SecondSearchDetailTableViewCell"
    
    var searchDetail: searchResult!
    
    //first detail cell class
    var firstIntros:[FirstIntro] = [
        FirstIntro(introTitle: "平日每小時收費", introContent: "500/hr"),
        FirstIntro(introTitle: "六日及國定假日每小時收費", introContent: "500/hr"),
        FirstIntro(introTitle: "特殊時段每小時加收費", introContent: "500/hr"),
        FirstIntro(introTitle: "特殊時段備註", introContent: "24小時"),
        FirstIntro(introTitle: "每趟最低時限", introContent: "6小時"),
        FirstIntro(introTitle: "托育經驗起始日", introContent: "2016/08/03"),
        FirstIntro(introTitle: "特殊托育經驗", introContent: "我有帶過自閉症兒童，過動兒"),
        FirstIntro(introTitle: "自我介紹", introContent: "親愛的爸爸媽媽你們好，我有過十年的托育經驗。我自己非常愛小孩子，家中有四個小孩，最大的已經高中，希望有機會合作。")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = UIImage(named: searchDetail.imageResult)
        self.title = searchDetail.nameResult
        detailStarRating.rating = searchDetail.starResult

        //detailTableView
        IntroDetailTableView.delegate = self
        IntroDetailTableView.dataSource = self
        IntroDetailTableView.estimatedRowHeight = 80
        IntroDetailTableView.rowHeight = UITableViewAutomaticDimension
        IntroDetailTableView.registerNib(UINib(nibName: "SearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: customCellIdentifier)
        IntroDetailTableView.registerNib(UINib(nibName: "SecondSearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: secondCustomCellIdentifier)
        
        //table headerView Datersource
        babysitterIDTitle.text = searchDetail.introClasses[8].introClassTitle
        babysitterIDNumLabel.text = searchDetail.introClasses[8].introClassContent
        babysitterWeekDayTitle.text = searchDetail.introClasses[0].introClassTitle
        babysitterWeekDayNum.text = searchDetail.introClasses[0].introClassContent
        babysitterFinishedTitle.text = searchDetail.introClasses[9].introClassTitle
        babysitterFinishedNum.text = searchDetail.introClasses[9].introClassContent
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DetailTableView datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 6 || indexPath.row == 7 {
        let cell = tableView.dequeueReusableCellWithIdentifier("SecondSearchDetailTableViewCell", forIndexPath: indexPath) as! SecondSearchDetailTableViewCell
            
//            cell.secondIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
//            cell.secondIntroCellContentLabel.text = firstIntros[indexPath.row].introContent
            
            // refactor as struct
            
            cell.secondIntroCellTitleLabel.text = searchDetail.introClasses[indexPath.row].introClassTitle
            cell.secondIntroCellContentLabel.text = searchDetail.introClasses[indexPath.row].introClassContent
            
            return cell
        } else {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchDetailTableViewCell", forIndexPath: indexPath) as! SearchDetailTableViewCell
            
//            cell.firstIntroCellTitleLabel.text = firstIntros[indexPath.row].introTitle
//            cell.firstIntroCellContentLabel.text = firstIntros[indexPath.row].introContent
            
            // refactor as struct
            
            cell.firstIntroCellTitleLabel.text = searchDetail.introClasses[indexPath.row].introClassTitle
            cell.firstIntroCellContentLabel.text = searchDetail.introClasses[indexPath.row].introClassContent
            
            return cell
        }
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

    @IBAction func ChatViewButton(sender: AnyObject) {
        
        let chatItemsDecorator = TGChatItemsDecorator()
        let demoDataSource = TGChatDataSource()
        demoDataSource.chatItems = DemoChatItemFactory.createChatItemsTG()
        
        let chatVC = TGChatViewController()
        chatVC.chatItemsDecorator = chatItemsDecorator
        chatVC.chatDataSource = demoDataSource
        chatVC.title = title
        
        // pass search data to chatVC
        chatVC.searchChatDetail = self.searchDetail
        
//        let navController = UINavigationController(rootViewController: chatVC)
//        self.presentViewController(navController, animated: true, completion: nil)
        self.navigationController?.pushViewController(chatVC, animated: true)

    }

}
