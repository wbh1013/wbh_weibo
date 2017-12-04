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
        let account = WBHAccountTool.account();
        let params:Dictionary<String,Any> = [
            "access_token":account.access_token ?? "",
            "count":4
        ]
        print("参数： \(params)")
        WBHNetTool.getRequst(withUrl: "2/statuses/public_timeline.json", withParams: params , success: { (obj) in
            let dictData  = obj.value as! NSDictionary
        
            print(dictData);
        }) { (error) in

        }
        

        
    }

}
