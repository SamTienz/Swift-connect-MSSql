//
//  RegisterVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/19.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var registerView: RegisterView!
    var layer = CAShapeLayer()
    var accArray:[String]!
    var idArray:[Int]!
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        self.registerView.accTextField.delegate = self
        self.registerView.userNameTextField.delegate = self
        self.registerView.cfmPwTextField.delegate = self
        self.registerView.pwTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func registerBtnAction(_ sender: UIButton) {
        if checkAccCorrect() && checkPwCorrect(){
            if checkAccRepeated(regAcc: self.registerView.accTextField.text!) {
                TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "此帳號已存在")
            }else{
                registerToSql()
            }
        }
    }
    func checkPwCorrect() -> Bool{
        if self.registerView.pwTextField.text == ""{
            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "密碼不能為空")
            return false
        }else if self.registerView.pwTextField.text != self.registerView.cfmPwTextField.text{
            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "密碼與確認密碼不相同")
            self.registerView.pwTextField.text = ""
            self.registerView.cfmPwTextField.text = ""
            return false
        }else{
            return true
        }
    }
    func checkAccCorrect() -> Bool {
        if self.registerView.accTextField.text == ""{
            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "帳號不能為空")
            return false
        }else if self.registerView.userNameTextField.text == ""{
            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "使用者名稱不能為空")
            return false
        }else{
            return true
        }
    }
    func checkAccRepeated(regAcc:String) -> Bool{
        var repeated = false
        accArray.forEach { (acc) in
            if acc == regAcc{
                repeated = true
            }
        }
        return repeated
    }
    func getInfo(){
        accArray = []
        idArray = []
//        SQLClient.sharedInstance()?.execute("select Account from Member", completion: { (result) in
//            for table in result as! [[[String:AnyObject]]] {
//                for row in table{
//                    for (column,value) in row{
//                        self.accArray.append(value as! String)
//                    }
//                }
//            }
//        })
//        SQLClient.sharedInstance()?.execute("select User_ID from Member", completion: { (result) in
//            for table in result as! [[[String:AnyObject]]] {
//                for row in table{
//                    for (column,value) in row{
//                        self.idArray.append(value as! Int)
//                    }
//                }
//            }
//        })
    }
    func registerToSql(){
//        SQLClient.sharedInstance()?.execute("insert into Member(User_ID,User_Name,Account,Password,Team_ID) values ('\(idArray.max()! + 1)','\(self.registerView.userNameTextField.text!)','\(self.registerView.accTextField.text!)','\(self.registerView.pwTextField.text!)',null)", completion: { (success) in
//            TaskModel.OkAlertTask(vc: self, title: "成功", message: "成功註冊")
//        })
        getInfo()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let path = UIBezierPath(roundedRect: textField.frame, cornerRadius: 5)
        layer.path = path.cgPath
        layer.lineWidth = 3
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.registerView.layer.addSublayer(layer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.2 // seconds
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "line")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.removeFromSuperlayer()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.registerView.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
