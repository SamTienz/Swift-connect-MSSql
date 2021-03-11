//
//  TaskModel.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/19.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class TaskModel: NSObject {
    class func OkAlertTask(vc:UIViewController,title:String,message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
