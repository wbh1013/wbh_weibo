//
//  WBHAccountTool.swift
//  WEIBO
//
//  Created by hjy on 2017/11/27.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

let accountArray:NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
let path = (accountArray.lastObject as! NSString).appendingPathExtension("account.archive");

class WBHAccountTool: NSObject {

    static func saveAccount(Account account:WBHAccount){

        print(path ?? "")
        NSKeyedArchiver.archiveRootObject(account, toFile: path! )
    }
    
    static func account() -> WBHAccount{
       let fileMange =   FileManager.default
        print(fileMange.fileExists(atPath: path!))
        if  fileMange.fileExists(atPath: path!) {
            let account:WBHAccount = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! WBHAccount
            let expores_in_str = "\(String(describing: account.expires_in))"
            let expores_in =   account.expires_in?.int64Value
            print("\(expores_in_str)----\(String(describing: expores_in))")
            let exporesTime = (account.create_time)?.addingTimeInterval(TimeInterval(expores_in!))
            let nowDate = NSDate.init()
            let result:ComparisonResult  = (exporesTime?.compare(nowDate as Date))!
            
            if result != ComparisonResult.orderedDescending {
                let account:WBHAccount = WBHAccount()
                account.access_token = ""
                account.expires_in = 0
                account.remind_in = ""
                account.isRealName = ""
                account.create_time = Date.init(timeIntervalSince1970: 0)
                account.uid = ""
                NSKeyedArchiver.archiveRootObject(account, toFile: path!)
                return  account
            }else{
                return account
            }
        }else{
            let account:WBHAccount = WBHAccount()
            account.access_token = ""
            account.expires_in = 0
            account.remind_in = ""
            account.isRealName = ""
            account.create_time = Date.init(timeIntervalSince1970: 0)
            account.uid = ""
            return account
        }
     
        
    }
    
}
