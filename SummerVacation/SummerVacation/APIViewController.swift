//
//  APIViewController.swift
//  SummerVacation
//
//  Created by 石部達也 on 2015/08/21.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit

class APIViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Rails API"

        //cellの登録
        var nib  = UINib(nibName: "UserTableViewCell", bundle:nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier:"UserTableViewCell")
        
        
        let userSession = UserInfoFetcher()

        userSession.showUser { (items) -> Void in
            self.users = items
            self.tableView.reloadData()
        }
        
        self.setCustomButton()
    }
    
    private func setCustomButton (){
        
        var customButton :UIButton = UIButton(frame: CGRectMake(0, 0, 20, 20))
        customButton.setBackgroundImage(UIImage(named: "Setting"), forState: UIControlState.Normal)
        customButton.addTarget(self, action:  Selector("settingButtonTapped"), forControlEvents: .TouchUpInside)
        var customButtonItem :UIBarButtonItem = UIBarButtonItem(customView: customButton)
        self.navigationItem.rightBarButtonItem = customButtonItem
        
    }
    
    func settingButtonTapped () {
        let userSession = UserInfoFetcher()

        userSession.showUser { (items) -> Void in
            self.users = items
            self.tableView.reloadData()
        }
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
    
    @IBAction func nextController(sender: AnyObject) {
        
        var pc = RealmViewController(nibName: "RealmViewController", bundle: nil)
        self.navigationController?.pushViewController(pc, animated: true)

    }
    
}
