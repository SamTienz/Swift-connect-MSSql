//
//  ManageView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/24.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class ManageView: UIView {
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var leaderIdTF: UITextField!
    @IBOutlet weak var teamNameTF: UITextField!
    @IBOutlet weak var deleteTeamBtn: UIButton!
    override func awakeFromNib() {
        deleteTeamBtn.layer.borderColor = UIColor.red.cgColor
        deleteTeamBtn.layer.borderWidth = 1
        deleteTeamBtn.layer.cornerRadius = 5
        leaderIdTF.attributedPlaceholder = NSAttributedString(string: "輸入新隊長ID", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        teamNameTF.attributedPlaceholder = NSAttributedString(string: "輸入新隊伍名稱", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
