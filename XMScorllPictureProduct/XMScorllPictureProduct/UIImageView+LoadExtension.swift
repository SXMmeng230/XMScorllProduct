//
//  UIImageView+LoadExtension.swift
//  XMScorllPictureProduct
//
//  Created by mac on 15/12/28.
//  Copyright © 2015年 yueDi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func xm_setImageViewString(imageStr:String){
        self.xm_setImageViewString(imageStr, placehoder: "fenmian_breathingLianxi");
    }
    func xm_setImageViewString(imageStr:String,options:KingfisherOptionsInfo){
      self.xm_setImageViewString(imageStr, placehoder:"fenmian_breathingLianxi", options: options)
    }
    func xm_setImageViewString(imageStr:String,placehoder:String,options:KingfisherOptionsInfo){
        if isUrl(imageStr){
            self.kf_setImageWithURL(NSURL(string: imageStr)!, placeholderImage: UIImage(named: placehoder), optionsInfo: options, completionHandler: nil)
        }else {
            self.image =  UIImage(named: imageStr)
        }
    }
    func xm_setImageViewString(string:String,placehoder:String){
        if isUrl(string){
        self.kf_setImageWithURL(NSURL(string: string)!, placeholderImage: UIImage(named: placehoder))
        }else {
           self.image =  UIImage(named: string)
        }
    }
    func isUrl(str:String) ->Bool{
        if str.hasPrefix("http"){
          return true
        }
        return false
    }

}
