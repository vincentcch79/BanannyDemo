//
//  SearchResultClass.swift
//  BanannyDemo
//
//  Created by 張智涵 on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import Foundation


class searchResult {
    
    var nameResult = ""
    var imageResult = ""
    var starResult = 0.0
    var numResult = ""
    var detailIntro = ""
    
    init(nameResult:String, imageResult:String, starResult: Double, numResult: String, detailIntro: String){
        self.nameResult = nameResult
        self.imageResult = imageResult
        self.starResult = starResult
        self.numResult = numResult
        self.detailIntro = detailIntro
    }

    
}


