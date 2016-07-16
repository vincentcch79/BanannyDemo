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

class SearchDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailStarRating: CosmosView!
    @IBOutlet weak var detailIntroLabel: UILabel!
    
    var searchDetail: searchResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = UIImage(named: searchDetail.imageResult)
        detailNameLabel.text = searchDetail.nameResult
        detailStarRating.rating = searchDetail.starResult
        detailIntroLabel.text = searchDetail.detailIntro
        
        

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
    @IBAction func backToSearchButton(sender: AnyObject) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let searchResultViewController: UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("searchView")
        self.presentViewController(searchResultViewController, animated: true, completion: nil)

    }
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
        
        let navController = UINavigationController(rootViewController: chatVC)
        self.presentViewController(navController, animated: true, completion: nil)

    }

}
