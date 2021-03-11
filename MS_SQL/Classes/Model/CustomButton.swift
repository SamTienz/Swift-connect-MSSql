//
//  CustomButton.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/20.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
