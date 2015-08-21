//
//  RealmViewController.swift
//  SummerVacation
//
//  Created by 石部達也 on 2015/08/21.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users :Results<UserObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Realm Data"
        
        //cellの登録
        var nib  = UINib(nibName: "UserTableViewCell", bundle:nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier:"UserTableViewCell")
        
        self.users = Realm().objects(UserObject)
        self.tableView.reloadData()

    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "UserTableViewCell"
        
        var cell: UserTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? UserTableViewCell
        
        if cell == nil {
            cell = UserTableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell!.userName!.text = users[indexPath.row].name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 78.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

  
}
