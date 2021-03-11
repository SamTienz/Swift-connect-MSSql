//
//  TeamListVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/23.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class TeamListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var teamListView: TeamListView!
    var teamCount:Int! = 0
    var teamName:[String]! = []
    var user_Id:Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        teamListView.teamListTV.delegate = self
        teamListView.teamListTV.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getTeamInfo()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamCount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TeamListCell = tableView.dequeueReusableCell(withIdentifier: "teamListCellID", for: indexPath) as! TeamListCell
        cell.teamNameLabel.text = teamName[indexPath.row]
        cell.inTeamBtn.tag = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SQLClient.sharedInstance()?.execute("select Team_ID from Team WHERE Team_Name = '\(teamName[indexPath.row])'", completion: { (result) in
            for table in result as! [[[String:AnyObject]]]{
                for row in table{
                    for (column,value) in row{
                        SQLClient.sharedInstance()?.execute("UPDATE [Member] SET  [Team_ID] = \(value as! Int) WHERE [User_ID] = \(self.user_Id!);", completion: { (result) in
                            TaskModel.OkAlertTask(vc: self, title: "成功", message: "加入隊伍成功")
                        })
                    }
                }
            }
        })
    }
    @IBAction func inTeamBtnAction(_ sender: UIButton) {
        SQLClient.sharedInstance()?.execute("select Team_ID from Member where User_ID = \(user_Id!)", completion: { (result) in
            for table in result as! [[[String:AnyObject]]]{
                for row in table{
                    for (column,value) in row{
                        if value as? Int == nil{
                            self.tableView(self.teamListView.teamListTV, didSelectRowAt: IndexPath(row: sender.tag, section: 0))
                        }else{
                            TaskModel.OkAlertTask(vc: self, title: "錯誤", message: "已經有隊伍，請先退出隊伍後重試")
                        }
                    }
                }
            }
        })
        
    }
    func getTeamInfo(){
//        SQLClient.sharedInstance()?.execute("select count(Team_ID) TeamCount from Team", completion: { (result) in
//            for table in result as! [[[String:AnyObject]]]{
//                for row in table{
//                    for (column,value) in row{
//                        self.teamCount = value as! Int
//                    }
//                }
//            }
//        })
//        SQLClient.sharedInstance()?.execute("select Team_Name from Team", completion: { (result) in
//            for table in result as! [[[String:AnyObject]]]{
//                for row in table{
//                    for (column,value) in row{
//                        self.teamName.append(value as! String)
//
//                    }
//                }
//            }
//            self.teamListView.teamListTV.reloadData()
//        })
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
