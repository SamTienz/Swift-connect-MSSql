//
//  MyTeamView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/24.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class MyTeamView: UIView {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var leaderLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var matchesLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    @IBOutlet weak var exitTeamBtn: UIButton!
    override func awakeFromNib() {
        exitTeamBtn.layer.cornerRadius = 5
        exitTeamBtn.layer.borderWidth = 1
        exitTeamBtn.layer.borderColor = UIColor.red.cgColor
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
