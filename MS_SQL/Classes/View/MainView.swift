//
//  MainView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/19.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class MainView: UIView {

    @IBOutlet weak var accTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var registerBtn: CustomButton!
    @IBOutlet weak var loginBtn: CustomButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var pwIcon: UIImageView!
    @IBOutlet weak var accIcon: UIImageView!
    override func awakeFromNib() {
        accTextField.attributedPlaceholder = NSAttributedString(string: "帳號", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        pwTextField.attributedPlaceholder = NSAttributedString(string: "密碼", attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
