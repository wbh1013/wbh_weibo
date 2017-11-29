//
//  WBHNetTool.swift
//  WEIBO
//
//  Created by hjy on 2017/11/29.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit
import Alamofire
//public func postRequest(params _:Dictionary<String,Any>){
//    
//}

class WBHNetTool: NSObject {
    static public func postRequst(withUrl url:String, withParams params:Dictionary<String,Any>) -> Void{
        Alamofire.request(url, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: Alamofire.SessionManager.defaultHTTPHeaders).responseJSON { (responseJson) in
            
            if let error = responseJson.error {
                
            }else{
                
            }
                
            
            
            
            
        }
        
    }
}
