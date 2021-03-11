//
//  HomeView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/22.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func awakeFromNib() {
        welcomeLabel.adjustsFontSizeToFitWidth = true
        welcomeLabel.minimumScaleFactor = 0.2
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
