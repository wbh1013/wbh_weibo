//
//  WBHWeiboViewController.swift
//  WEIBO
//
//  Created by hjy on 2017/11/17.
//  Copyright © 2017年 baohong. All rights reserved.
//

import Alamofire
class WBHWeiboViewController: WBHBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
//2.00s2mVAEsdVK3B12603b7e74APQgIB
   
        let params = [
            "access_token":"2.00s2mVAEsdVK3B12603b7e74APQgIB"
//            "client_id":"1243717140",
//            "client_secret":"a3b2a736c17058717d537ac9e8fc8dbd",
//            "grant_type":"authorization_code",
//            "code":code,
//            "redirect_uri":"http://www.baidu.com"
        ]
        
        Alamofire.request("https://api.weibo.com/2/statuses/public_timeline.json", method: .get, parameters: params, encoding: URLEncoding.default, headers:  Alamofire.SessionManager.defaultHTTPHeaders).responseJSON(completionHandler: { (responeData) in
            let dictData  = responeData.value as! NSDictionary
            
            print(dictData);
            
            
        })
        
    }

}
