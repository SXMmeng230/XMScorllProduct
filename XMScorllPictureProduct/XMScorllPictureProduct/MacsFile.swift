//
//  MacsFile.swift
//  XMScorllPictureProduct
//
//  Created by mac on 15/12/24.
//  Copyright © 2015年 yueDi. All rights reserved.
//

import Foundation
import UIKit
func kTotalRowsInSection(dataArr:[AnyObject]) -> Int{
    return dataArr.count * 100
}
func kCenterRows(dataArr:[AnyObject]) -> Int{
    return Int(Float(kTotalRowsInSection(dataArr)) * 0.5)
}
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) ->UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}