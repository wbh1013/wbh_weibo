//
//  WBHAccount.swift
//  WEIBO
//
//  Created by hjy on 2017/11/27.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

class WBHAccount: NSObject ,NSCoding{
 
    public var access_token:String?
    public var create_time:NSDate?
    public var expires_in:String?
    public var isRealName:Bool?
    public var remind_in:String?
    public var uid:String?
    
    static  open func initAccountWithDict(accountDict dict:NSDictionary) -> WBHAccount {
        print(dict)
        let account = WBHAccount.init()
        account.access_token = dict["access_token"] as? String
        account.expires_in   = dict["expires_in"]   as? String
        account.isRealName   = dict["isRealName"]   as? Bool
        account.remind_in    = dict["remind_in"]    as? String
        account.uid          = dict["uid"]          as? String
        account.create_time  = NSDate.init()
        return account
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in,   forKey: "expires_in")
        aCoder.encode(isRealName,   forKey: "isRealName")
        aCoder.encode(remind_in,    forKey: "remind_in")
        aCoder.encode(uid,          forKey: "uid")
        aCoder.encode(create_time,  forKey: "create_time")
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init()
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_in   = aDecoder.decodeObject(forKey: "expires_in")   as? String
        isRealName   = aDecoder.decodeObject(forKey: "isRealName")   as? Bool
        remind_in    = aDecoder.decodeObject(forKey: "remind_in")    as? String
        uid          = aDecoder.decodeObject(forKey: "uid")          as? String
        create_time  = aDecoder.decodeObject(forKey: "create_time")  as? NSDate
   
    
    }
    override init() {
     
        super.init()
    }
    
}
