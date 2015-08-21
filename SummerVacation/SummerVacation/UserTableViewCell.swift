//
//  UserTableViewCell.swift
//  SummerVacation
//
//  Created by 石部達也 on 2015/08/21.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
