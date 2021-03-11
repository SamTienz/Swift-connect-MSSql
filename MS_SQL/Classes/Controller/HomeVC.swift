//
//  HomeVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/22.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit
class UserData{
    var user_ID:Int!
    var userName:String!
    var account:String!
    var password:String!
    var team_ID:Int?
    init() {
        user_ID = 0
        userName = ""
        account = ""
        password = ""
    }
}
class HomeVC: UIViewController {

    @IBOutlet var homeView: HomeView!
    static var userAcc:String!
    static var userId:Int!
    var user:UserData!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getUserInfo()
    }
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goEdit", sender: nil)
    }
    @IBAction func searchTeamBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goTeamList", sender: nil)
    }
    @IBAction func myTeamBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goMyTeam", sender: nil)
    }
    @IBAction func createTeamBtnAction(_ sender: Any) {
        performSegue(withIdentifier: "goCreateTeam", sender: nil)
//        if user.team_ID != nil{
//            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "你已擁有隊伍")
//        }else{
//
//        }
    }
    @IBAction func manageBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "goManageTeam", sender: nil)
//        if user.team_ID == nil{
//            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "你尚未加入隊伍")
//        }else{
//            SQLClient.sharedInstance()?.execute("select Leader_ID from Team where Team_ID = \(user.team_ID!)", completion: { (result) in
//                for table in result as! [[[String:AnyObject]]]{
//                    for row in table{
//                        for (column,value) in row{
//                            if value as! Int == self.user.user_ID!{
//
//                            }else{
//                                TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "你並不是隊長，無法使用此功能")
//                            }
//                        }
//                    }
//                }
//            })
//        }
    }
    
    func getUserInfo(){
//        self.user = UserData()
        self.homeView.welcomeLabel.text = "Welcome,Admin"
//        SQLClient.sharedInstance()?.execute("select * from Member where Account = '\(HomeVC.userAcc!)'", completion: { (result) in
//            for table in result as! [[[String:AnyObject]]]{
//                for row in table{
//                    for (column,value) in row{
//                        switch column{
//                        case "User_ID":
//                            self.user.user_ID = value as! Int
//                        case "User_Name":
//                            self.user.userName = value as! String
//                        case "Account":
//                            self.user.account = value as! String
//                        case "Password":
//                            self.user.password = value as! String
//                        case "Team_ID":
//                            self.user.team_ID = value as? Int
//                        default:
//                            print("Error")
//                        }
//                    }
//                }
//            }
//        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goEdit"{
            let vc = segue.destination as! EditInfoVC
//            vc.editUserID = user.user_ID
        }else if segue.identifier == "goMyTeam"{
            let vc = segue.destination as! MyTeamVC
//            if user.team_ID != nil{
//                vc.team_ID = user.team_ID!
//                vc.user_ID = user.user_ID!
//            }
        }else if segue.identifier == "goTeamList"{
            let vc = segue.destination as! TeamListVC
//            vc.user_Id = user.user_ID!
        }else if segue.identifier == "goManageTeam"{
            let vc = segue.destination as! ManageVC
//            vc.teamID = user.team_ID!
        }
    }

}
