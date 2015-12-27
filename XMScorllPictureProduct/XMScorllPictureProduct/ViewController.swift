//
//  ViewController.swift
//  XMScorllPictureProduct
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 yueDi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "轮播图"
        // Do any additional setup after loading the view, typically from a nib.
        let xms = NSBundle.mainBundle().loadNibNamed("XMScorllView", owner: nil, options: nil).first as! XMScorllView
        xms.frame = CGRectMake(0, 44, view.bounds.width, 300)
        let object1 = XMScrollObject()
            object1.name = "今天新闻头条"
            object1.imageName = "fenmian_breathingLianxi"
        let object2 = XMScrollObject()
        object2.name = "圣诞节,奥巴马访问中国"
        object2.imageName = "fenmian_zhuanzhuli"
        let object3 = XMScrollObject()
        object3.name = "欢迎进入新闻频道"
        object3.imageName = "fenmian_lovely"
        xms.scorllArray = [object1,object2,object3]
        view.addSubview(xms)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

