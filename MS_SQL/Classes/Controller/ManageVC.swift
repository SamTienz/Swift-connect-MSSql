//
//  ManageVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/24.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class ManageVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var manageView: ManageView!
    var teamID = 0
    var layer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manageView.leaderIdTF.delegate = self
        self.manageView.teamNameTF.delegate = self
//        SQLClient.sharedInstance()?.execute("select Team_Name from Team where Team_ID = \(teamID)", completion: { (result) in
//            for table in result as! [[[String:AnyObject]]]{
//                for row in table{
//                    for (column,value) in row{
//                        self.manageView.teamNameLabel.text = value as! String
//                    }
//                }
//            }
//        })
        // Do any additional setup after loading the view.
    }
    @IBAction func deleteTeamBtnAction(_ sender: UIButton) {
        SQLClient.sharedInstance()?.execute("DELETE FROM [Team] WHERE [Team_ID] = \(teamID);", completion: { (result) in
            SQLClient.sharedInstance()?.execute("UPDATE [dbo].[Member] SET  [Team_ID] = NULL WHERE [Team_ID] = \(self.teamID);", completion: { (resut) in
                let alert = UIAlertController(title: "提示", message: "成功解散隊伍", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            })
        })
    }
    @IBAction func saveBtnAction(_ sender: UIButton) {
        if checkNeedSave(){
            if self.manageView.leaderIdTF.text != ""{
                SQLClient.sharedInstance()?.execute("UPDATE [dbo].[Team] SET  [Leader_ID] = \(self.manageView.leaderIdTF.text!) WHERE [Team_ID] = \(teamID);", completion: { (result) in
                    SQLClient.sharedInstance()?.execute("UPDATE [dbo].[Member] SET  [Team_ID] = \(self.teamID) WHERE [User_ID] = \(self.manageView.leaderIdTF.text!);", completion: nil)
                })
                
            }
            if self.manageView.teamNameTF.text != ""{
                SQLClient.sharedInstance()?.execute("UPDATE [dbo].[Team] SET  [Team_Name] = '\(self.manageView.teamNameTF.text!)' WHERE [Team_ID] = \(teamID);", completion: { (result) in
                    self.manageView.teamNameLabel.text = self.manageView.teamNameTF.text!
                    let alert = UIAlertController(title: "提示", message: "修改成功", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                })
            }
        }
    }
    func checkNeedSave() -> Bool{
        return self.manageView.leaderIdTF.text != "" || self.manageView.teamNameTF.text != ""
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let path = UIBezierPath(roundedRect: textField.frame, cornerRadius: 5)
        layer.path = path.cgPath
        layer.lineWidth = 3
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.manageView.layer.addSublayer(layer)
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
        self.manageView.endEditing(true)
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
