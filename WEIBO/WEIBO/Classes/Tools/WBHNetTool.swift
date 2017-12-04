//
//  WBHNetTool.swift
//  WEIBO
//
//  Created by hjy on 2017/11/29.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit
import Alamofire

typealias Success = (DataResponse<Any>)    -> Void
typealias Failure = (NSError) -> Void

class WBHNetTool: NSObject {
    
//MARK - get请求
    static public func getRequst(withUrl url:String, withParams params:Dictionary<String,Any>, success susse: @escaping Success, failure fail: @escaping Failure) -> Void{

        let allUrl = BaseUrl + url
        print("allUrl---- : \(allUrl)")
        Alamofire.request(allUrl, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: Alamofire.SessionManager.defaultHTTPHeaders).responseJSON { (responseJson) in
            if let error = responseJson.error {
                fail(error as NSError)
            }else{
                susse(responseJson)
            }
        }
    }
    
//MARK - POST请求
    static public func POSTRequest(withUrl url:String, withParams params:Dictionary<String,Any>, success susse: @escaping Success, failure fail: @escaping Failure) -> Void{
        let allUrl = BaseUrl + url
         print("allUrl---- : \(allUrl)")
        Alamofire.request(allUrl, method: .post, parameters: params, encoding:URLEncoding.default, headers: Alamofire.SessionManager.defaultHTTPHeaders).responseJSON { (responseJson) in
            if let error = responseJson.error {
                fail(error as NSError)
            }else{
                susse(responseJson)
            }
        }
    }
}
