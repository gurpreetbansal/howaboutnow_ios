//
//  Card.swift
//  Example
//
//  Created by HideakiTouhara on 2018/05/17.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import UIKit
import SDWebImage

class Card: UIView {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func prepareUI(Name: String, Age: String,Address: String, img: String) {
        userName.text = Name + ", " + Age
        userImage.sd_setImage(with: URL(string:img), placeholderImage: UIImage(named: "Unknown"))
        userAddress.text = Address
    }
}
