//
//  WBHTabBarController.swift
//  WEIBO
//
//  Created by hjy on 2017/11/17.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

class WBHTabBarController: UITabBarController ,WBHTabbarViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加tabbar
        let tabbarFrame = self.tabBar.bounds
        let customTabbar = WBHTabbarView(frame: tabbarFrame)
        customTabbar.delegate = self
        self.tabBar.addSubview(customTabbar)
        //添加控制器
        self.addChildViewControllers();
    
    }
    
// MARK - 添加控制器
    private func addChildViewControllers(){
        //微博
        self.addVC(viewController: WBHOauthController())
        //消息
        self.addVC(viewController: WBHMessageController())
        //发现
        self.addVC(viewController: WBHDiscoverController())
        //我
        self.addVC(viewController: WBHMessageController())
        
    }
    private func addVC(viewController VC:UIViewController){
        let nav = wbhNavigationController.init(rootViewController: VC)
    //    nav.jz_fullScreenInteractivePopGestureEnabled = true
        self.addChildViewController(nav)
    }

// MARK - WBHTabbarViewDelegate
    func buttonClick(fromBtn frombutton: WBHTabBarButton, inBtn inButto: WBHTabBarButton) {
        self.selectedIndex = inButto.tag
    }
    func addButtonClick() {
        self.present(WBHAddViewController(), animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.removeTabBarSubview()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //ios11系统要调用这个方法 否则系统tabbar子控件删除不掉
        self.removeTabBarSubview()
    }
// MARK - 删除tabbar的子控件
    private func removeTabBarSubview(){
        self.tabBar.subviews.forEach { (subview) in
            if subview is UIControl {
                subview.removeFromSuperview()
            }
        }
    }
}
