//
//  XMScrollCollectionCell.swift
//  XMScorllPictureProduct
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 yueDi. All rights reserved.
//

import UIKit

class XMScrollCollectionCell: UICollectionViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var image: UIImageView!
    var object:XMScrollObject! {
        willSet{
           image.image = UIImage.init(named: newValue.imageName!)
           nameLabel.text = newValue.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.backgroundColor = RGBA(0, g: 0, b: 0, a: 0.2)
    }
    

}
