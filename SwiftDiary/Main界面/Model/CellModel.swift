//
//  CellModel.swift
//  SwiftDiary
//
//  Created by 我是五高你敢信 on 2017/2/20.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CellModel: NSObject {

    
    /// 日期星期
    let date1: String
    /// 年月
    let date2: String
    /// 时分
    let date3: String
    
    /// 日记内容
    let detailText: String
    
    /// 地点
    let location: String
    
    /// 初始化model
    ///
    /// - Parameters:
    ///   - date: 日期格式： 日期星期／年月／时分
    ///   - detailText: 日记内容
    ///   - location: 地点
    init(date: String, detailText: String, location: String) {
        self.detailText = detailText
        self.location = location
        
        let array = date.components(separatedBy: "/")
        date1 = array[0]
        date2 = array[1]
        date3 = array[2]
        
        super.init()
        
    }
}
