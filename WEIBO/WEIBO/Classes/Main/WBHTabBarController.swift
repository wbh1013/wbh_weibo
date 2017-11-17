//
//  WBHTabBarController.swift
//  WEIBO
//
//  Created by hjy on 2017/11/17.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

class WBHTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
        for view in self.tabBar.subviews {
            if view.isKind(of: UIControl.self) {
                view.removeFromSuperview()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTabBar();
    
    }
    private func setTabBar(){
        //微博
        self.addChildVC(VC: WBHWeiboViewController(), titleString: "微博", normalImageString: "", selelctImageString: "")
        //发现
        self.addChildVC(VC: WBHDiscoverController(), titleString: "发现", normalImageString: "", selelctImageString: "")
    }

//MARK - 添加控制器
   private func addChildVC(VC viewController:UIViewController,titleString title:String,normalImageString normalImageStr:String,selelctImageString selelctImageStr:String)  {
    let nav = wbhNavigationController.init(rootViewController: viewController)
//    nav.jz_fullScreenInteractivePopGestureEnabled = true
    self.addChildViewController(nav)
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = UIImage.init(named: normalImageStr)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    nav.tabBarItem.selectedImage = UIImage.init(named: selelctImageStr)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }

}
