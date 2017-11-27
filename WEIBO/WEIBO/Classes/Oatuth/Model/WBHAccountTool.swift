//
//  WBHAccountTool.swift
//  WEIBO
//
//  Created by hjy on 2017/11/27.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

let accountArray:NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
let path = (accountArray.lastObject as! NSString).appendingPathComponent("account.archive");

class WBHAccountTool: NSObject {
   
    
    static func saveAccount(Account account:WBHAccount){
        
        print(path)
        NSKeyedArchiver.archiveRootObject(account, toFile: path)
    }
    
    static func account() -> WBHAccount{
        let account:WBHAccount = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! WBHAccount
        let expores_in = (account.expires_in! as NSString).longLongValue
        let exporesTime = (account.create_time)?.addingTimeInterval(TimeInterval(expores_in))
        let nowDate = NSDate.init()
        let result:ComparisonResult  = (exporesTime?.compare(nowDate as Date))!
        
        if result == ComparisonResult.orderedDescending {
            let account:WBHAccount? = nil
            return  account!
        }else{
            return account
        }
        
    }
    
}
