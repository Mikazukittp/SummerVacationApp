//
//  UserInfoFetcher.swift
//  SummerVacation
//
//  Created by 石部達也 on 2015/08/20.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class UserInfoFetcher: NSObject {
   
    func showUser(completion :(items :[User]) ->Void){
        
        Alamofire.request(.GET, "http://localhost:3000/api/v1/users")
            .responseJSON { _, _, jsonData, _ in
                let json = JSON(jsonData!)
                
                var users = [User]()
                for (index: String, subJson: SwiftyJSON.JSON) in json {
                    
                    let userId = subJson["id"].intValue
                    let userName = subJson["name"].stringValue
                    
                    var user = User(id :userId ,name :userName)
                    users.append(user)
                    
                    //Realmに保存
                    var userObject = UserObject()
                    userObject.id = userId
                    userObject.name = userName
                    
                    let realm = Realm()
                    realm.write {
                        realm.add(userObject)
                    }
                    
                }
                completion(items :users)
        }

    }
    
    
}
