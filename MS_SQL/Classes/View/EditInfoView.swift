//
//  EditInfoView.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/22.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class EditInfoView: UIView {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var oldPwTextField: UITextField!
    @IBOutlet weak var newPwTextField: UITextField!
    override func awakeFromNib() {
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "修改名稱請在此輸入新名稱", attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
        oldPwTextField.attributedPlaceholder = NSAttributedString(string: "修改密碼請在此輸入新密碼", attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
        newPwTextField.attributedPlaceholder = NSAttributedString(string: "請在此\"再次\"輸入新密碼", attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
