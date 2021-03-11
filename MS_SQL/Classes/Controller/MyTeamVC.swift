//
//  MyTeamVC.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/24.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class MyTeamVC: UIViewController {
    var team_ID = 0
    var user_ID = 0
    @IBOutlet var myTeamView: MyTeamView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if team_ID == 0 {
            let alert = UIAlertController(title: "提示", message: "您尚未加入隊伍", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .cancel, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            SQLClient.sharedInstance()?.execute("select * from Member,Team where Team.Team_ID = \(team_ID) and User_ID = Leader_ID", completion: { (result) in
                var matches = 0.0
                var win = 0.0
                for table in result as! [[[String:AnyObject]]]{
                    for row in table{
                        for (column,value) in row{
                            switch column{
                            case "User_Name":
                                self.myTeamView.leaderLabel.text = "隊長：\(value as! String)"
                            case "Team_Name":
                                self.myTeamView.teamNameLabel.text = "\(value as! String)"
                            case "Rank":
                                self.myTeamView.rankLabel.text = "排名：\(value as! Int)"
                            case "Matches":
                                self.myTeamView.matchesLabel.text = "對戰：\(value as! Int)"
                                matches = Double(value as! Int)
                            case "Win":
                                win = Double(value as! Int)
                            default:
                                print("LeakData")
                            }
                        }
                    }
                }
                self.myTeamView.winRateLabel.text = "勝率：\(String(format: "%.2f", (win/matches)*100))%"
            })
        }
    }
    @IBAction func exitTeamBtnAction(_ sender: Any) {
        SQLClient.sharedInstance()?.execute("UPDATE [Member] SET  [Team_ID] = NULL WHERE [User_ID] = \(user_ID);", completion: { (result) in
            let alert = UIAlertController(title: "提示", message: "你成功離開了隊伍", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確認", style: .cancel, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        })
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
