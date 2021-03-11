//
//  NewTeamVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/24.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class NewTeamVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var newTeamView: NewTeamView!
    var layer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newTeamView.leaderIdTF.delegate = self
        self.newTeamView.teamNameTF.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func createBtnAction(_ sender: Any) {
        SQLClient.sharedInstance()?.execute("select count(Team_ID) TeamCount from Team", completion: { (result) in
            for table in result as! [[[String:AnyObject]]]{
                for row in table{
                    for (column,value) in row{
                        SQLClient.sharedInstance()?.execute("INSERT INTO [Team] ([Leader_ID],[Team_ID],[Team_Name],[Rank],[Matches],[Win]) VALUES(\(self.newTeamView.leaderIdTF.text!),\(value as! Int + 1),'\(self.newTeamView.teamNameTF.text!)',0,0,0);", completion: { (result) in
                            SQLClient.sharedInstance()?.execute("UPDATE [dbo].[Member] SET  [Team_ID] = \(value as! Int + 1) WHERE [User_ID] = \(self.newTeamView.leaderIdTF.text!);", completion: nil)
                            let alert = UIAlertController(title: "提示", message: "成功創建隊伍", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                                self.navigationController?.popViewController(animated: true)
                            }))
                            self.present(alert, animated: true, completion: nil)
                        })
                    }
                }
            }
        })
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let path = UIBezierPath(roundedRect: textField.frame, cornerRadius: 5)
        layer.path = path.cgPath
        layer.lineWidth = 3
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.newTeamView.layer.addSublayer(layer)
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
        self.newTeamView.endEditing(true)
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
