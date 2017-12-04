//
//  WBHOauthController.swift
//  WEIBO
//
//  Created by hjy on 2017/11/27.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit
import Alamofire

class WBHOauthController: UIViewController ,UIWebViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        self.view.addSubview(webView);
        
        webView.delegate = self;
        let url:NSURL = NSURL.init(string: "https://api.weibo.com/oauth2/authorize?client_id=1243717140&redirect_uri=http://www.baidu.com&display=mobile")!
     
        let request = NSURLRequest.init(url: url as URL)
        webView.loadRequest(request as URLRequest)
    }

//Mark -


    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let urlStr = request.url?.absoluteString
        print("urlStr---\(String(describing: urlStr))");
        let range = urlStr?.range(of: "code=")
        if range != nil {
            let nsrange = urlStr?.nsRange(from: range!)
            let  fromIndex:Int = (nsrange?.length)! + (nsrange?.location)!
            let code = (urlStr! as NSString).substring(from: fromIndex)
            print(code)
 
            let params = [
                "client_id":"1243717140",
                "client_secret":"a3b2a736c17058717d537ac9e8fc8dbd",
                "grant_type":"authorization_code",
                "code":code,
                "redirect_uri":"http://www.baidu.com"
            ]
            
         //拿到code进行请求 获取access_token
            WBHNetTool.POSTRequest(withUrl: "oauth2/access_token", withParams: params, success: { (responeData) in
                let dictData  = responeData.value as! NSDictionary
                
                let account = WBHAccount.initAccountWithDict(accountDict: dictData as! Dictionary<String,Any>)
                //归档
                WBHAccountTool.saveAccount(Account: account);
                //重新设置rootViewController
                UIApplication.shared.keyWindow?.rootViewController = WBHTabBarController()
            }, failure: { (error) in
                
            })
            return false
        }
        return true
    }
    
}
//range转换为NSRange
extension String {
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from!),
                       length: utf16.distance(from: from!, to: to!))
    }
}


//extension String {
//    //Range转换为NSRange
//    func nsRange(from range: Range<String.Index>) -> NSRange {
//        let from = range.lowerBound.samePosition(in: utf16)
//        let to = range.upperBound.samePosition(in: utf16)
//
//        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from!),
//                       length: utf16.distance(from: from!, to: to!))
//    }
//
//    //Range转换为NSRange
//    func range(from nsRange: NSRange) -> Range<String.Index>? {
//        guard
//            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location,
//                                     limitedBy: utf16.endIndex),
//            let to16 = utf16.index(from16, offsetBy: nsRange.length,
//                                   limitedBy: utf16.endIndex),
//            let from = String.Index(from16, within: self),
//            let to = String.Index(to16, within: self)
//            else { return nil }
//        return from ..< to
//    }
//}


