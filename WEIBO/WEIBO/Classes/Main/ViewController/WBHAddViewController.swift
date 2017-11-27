//
//  WBHAddViewController.swift
//  WEIBO
//
//  Created by hjy on 2017/11/20.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

class WBHAddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let cancelBtn = UIButton.init(type: UIButtonType.custom)
        cancelBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 50);
        cancelBtn.backgroundColor = UIColor.red
        cancelBtn.addTarget(self, action: #selector(self.dismissVC), for: UIControlEvents.touchUpInside)
        self.view.addSubview(cancelBtn)
    }

    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
