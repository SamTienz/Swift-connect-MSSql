//
//  NewTeamView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/24.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class NewTeamView: UIView {

    @IBOutlet weak var teamNameTF: UITextField!
    @IBOutlet weak var leaderIdTF: UITextField!
    override func awakeFromNib() {
        teamNameTF.attributedPlaceholder = NSAttributedString(string: "輸入隊伍名稱", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        leaderIdTF.attributedPlaceholder = NSAttributedString(string: "輸入隊長ID", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
