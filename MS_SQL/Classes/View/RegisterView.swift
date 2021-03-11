//
//  RegisterView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/19.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    @IBOutlet weak var accTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var cfmPwTextField: UITextField!
    @IBOutlet weak var registerBtn: CustomButton!
    override func awakeFromNib() {
        accTextField.attributedPlaceholder = NSAttributedString(string: "請輸入您的帳號", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "請輸入您的使用者名稱", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        pwTextField.attributedPlaceholder = NSAttributedString(string: "請輸入您的密碼", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        cfmPwTextField.attributedPlaceholder = NSAttributedString(string: "請再次輸入您的密碼", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
