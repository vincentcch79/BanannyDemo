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
    var hourRseult = ""
    var finishResult = ""
    var startDay = ""
    var introClasses:[introClass] = []

    
    
    init(nameResult:String, imageResult:String, starResult: Double, numResult: String, hourResult: String, finishResult: String, startDay: String, introClasses: [introClass]){
        self.nameResult = nameResult
        self.imageResult = imageResult
        self.starResult = starResult
        self.numResult = numResult
        self.hourRseult = hourResult
        self.finishResult = finishResult
        self.startDay = startDay
        self.introClasses = introClasses
    }
    
    
}

struct introClass {
    
    var introClassTitle = ""
    var introClassContent = ""
    
}
