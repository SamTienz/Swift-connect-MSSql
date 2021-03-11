//
//  TeamListCell.swift
//  MS_SQL
//
//  Created by Tien on 2018/6/23.
//  Copyright © 2018年 Tien. All rights reserved.
//

import UIKit

class TeamListCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var inTeamBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
