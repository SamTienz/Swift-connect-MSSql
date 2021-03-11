//
//  MainVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/19.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITextFieldDelegate {

    var layer = CAShapeLayer()
    @IBOutlet var mainView: MainView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.logoImageView.alpha = 0
        self.mainView.logoImageView.transform = CGAffineTransform(scaleX: 10, y: 10)
        self.mainView.accTextField.alpha = 0
        self.mainView.pwTextField.alpha = 0
        self.mainView.registerBtn.alpha = 0
        self.mainView.loginBtn.alpha = 0
        self.mainView.accIcon.transform = CGAffineTransform(translationX: -30, y: 0)
        self.mainView.accIcon.alpha = 0
        self.mainView.pwIcon.transform = CGAffineTransform(translationX: -30, y: 0)
        self.mainView.pwIcon.alpha = 0
        self.navigationController?.navigationBar.isHidden = true
        self.mainView.accTextField.delegate = self
        self.mainView.pwTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 0.5, animations: {
            self.mainView.logoImageView.alpha = 1
            self.mainView.logoImageView.transform = .identity
        }) { (bool) in
            UIView.animate(withDuration: 0.5, animations: {
                self.mainView.accTextField.alpha = 1
                self.mainView.pwTextField.alpha = 1
                self.mainView.accIcon.alpha = 1
                self.mainView.pwIcon.alpha = 1
                self.mainView.accIcon.transform = .identity
                self.mainView.pwIcon.transform = .identity
            }, completion: { (bool) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.mainView.registerBtn.alpha = 1
                }, completion: { (bool) in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.mainView.loginBtn.alpha = 1
                    }, completion: { (bool) in
                        print("animated")
                    })
                })
            })
        }
    }
    @IBAction func loginBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goHome", sender: nil)
//        if self.mainView.accTextField.text! == "" || self.mainView.pwTextField.text! == ""{
//            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "請確實輸入帳號密碼")
//        }else{
//            SQLClient.sharedInstance()?.execute("select Password from Member where Account = '\(self.mainView.accTextField.text!)'", completion: { (result) in
//                for table in result as! [[[String:AnyObject]]]{
//                    if table.count == 0{
//                        TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "無此帳號")
//                    }
//                    for row in table{
//                        for (column,value) in row{
//                            if self.mainView.pwTextField.text! == value as! String{
//                                self.performSegue(withIdentifier: "goHome", sender: nil)
//                            }else{
//                                TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "密碼錯誤")
//                            }
//                        }
//                    }
//                }
//            })
//        }
    }
    @IBAction func registerBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goRegisterVC", sender: nil)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let path = UIBezierPath(roundedRect: textField.frame, cornerRadius: 5)
        layer.path = path.cgPath
        layer.lineWidth = 3
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.mainView.layer.addSublayer(layer)
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
        self.mainView.endEditing(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = false
        layer.removeFromSuperlayer()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goHome"{
            HomeVC.userAcc = self.mainView.accTextField.text!
        }
    }


}
