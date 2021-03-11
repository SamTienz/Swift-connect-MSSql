//
//  EditInfoVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/22.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class EditInfoVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var editInfoView: EditInfoView!
    var editUserID:Int! = 0
    var layer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editInfoView.userNameTextField.delegate = self
        self.editInfoView.oldPwTextField.delegate = self
        self.editInfoView.newPwTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func saveBtnAction(_ sender: UIButton) {
        if checkNameEditable(){
            SQLClient.sharedInstance()?.execute("UPDATE [Member] SET  [User_Name] = '\(self.editInfoView.userNameTextField.text!)' WHERE [User_ID] = \(editUserID!);", completion: { (result) in
                print("Name Edit Success")
            })
        }
        if checkPwEditable(){
            SQLClient.sharedInstance()?.execute("UPDATE [Member] SET  [Password] = '\(self.editInfoView.newPwTextField.text!)' WHERE [User_ID] = \(editUserID!);", completion: { (result) in
                print("Pw Edit Success")
            })
        }
        if checkNameEditable() || checkPwEditable(){
            let alert = UIAlertController(title: "完成", message: "修改已完成請重新登入", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }else {
            TaskModel.OkAlertTask(vc: self, title: "提示", message: "請輸入要修改的資訊")
        }
    }
    func checkPwEditable() -> Bool{
        return self.editInfoView.oldPwTextField.text != "" && self.editInfoView.oldPwTextField.text == self.editInfoView.newPwTextField.text
    }
    func checkNameEditable() -> Bool{
        return self.editInfoView.userNameTextField.text != ""
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let path = UIBezierPath(roundedRect: textField.frame, cornerRadius: 5)
        layer.path = path.cgPath
        layer.lineWidth = 3
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.editInfoView.layer.addSublayer(layer)
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
        self.editInfoView.endEditing(true)
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
