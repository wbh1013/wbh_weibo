//
//  WBHTabbarView.swift
//  WEIBO
//
//  Created by 王宝弘 on 2017/11/19.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

protocol WBHTabbarViewDelegate {
    func buttonClick(fromBtn frombutton:WBHTabBarButton , inBtn inButto:WBHTabBarButton)
    func addButtonClick()
}

class WBHTabbarView: UIView {

    var buttonArray:[WBHTabBarButton]? = nil
    var selectButton:WBHTabBarButton? = nil
    
    var  delegate:WBHTabbarViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let buttonWidth:CGFloat  = self.frame.size.width / 5
        let buttonHeight:CGFloat = self.frame.size.height
        
        //加号button
        let addButton = UIButton(type: UIButtonType.custom)
        addButton .addTarget(self, action: #selector(self.addButtonClick(addButton:)), for: UIControlEvents.touchDown)
        addButton.bounds = CGRect(x:0 , y: 0, width: buttonHeight + 8, height: buttonHeight - 5)
        addButton.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        addButton.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        addButton.center = self.center
        addButton.layer.cornerRadius = 3
        addButton.layer.masksToBounds = true
        addButton.backgroundColor = UIColor.orange
        self.addSubview(addButton)
        
        for i in 0...3 {
            let button = WBHTabBarButton(type: UIButtonType.custom)
            button.setTitle(self.titleArray[i], for: UIControlState.normal)
            button.setTitleColor(WBHTools.colorWithHexString(hexString: "818181"), for: UIControlState.normal)
            button.setImage(UIImage.init(named: self.buttonNomalImage[i]), for: UIControlState.normal)
            button.setImage(UIImage.init(named: self.buttonSelectImage[i]), for: UIControlState.selected)
            button.setImage(UIImage.init(named: self.buttonHightlightImage[i]), for: UIControlState.highlighted)
            if i >= 2{
                button.frame = CGRect(x: CGFloat(i + 1) * buttonWidth , y: 0, width: buttonWidth, height: buttonHeight)
            }else{
                if i == 0 {
                    selectButton = button;
                    selectButton?.isSelected = true
                }
                button.frame = CGRect(x: CGFloat(i) * buttonWidth , y: 0, width: buttonWidth, height: buttonHeight)
            }
            button.tag = i;
            button.addTarget(self, action: #selector(self.buttonClick(button:)), for: UIControlEvents.touchDown)
            self.addSubview(button)
        }
    }
//MARK - 加号按钮点击
    @objc func addButtonClick(addButton:UIButton){
        delegate?.addButtonClick()
    }
//MARK - 按钮点击
    @objc func buttonClick(button btn:WBHTabBarButton) {
        if btn == selectButton {
            return;
        }
        btn.isSelected = true
        selectButton?.isSelected = false
        selectButton = btn
        delegate?.buttonClick(fromBtn: selectButton!, inBtn: btn)
    }

//MARK - 懒加载
    var titleArray:[String] = {
        return ["微博","消息","发现","我"]
    }()
    var buttonNomalImage:[String] = {
       return ["tabbar_home","tabbar_message_center","tabbar_discover","tabbar_profile"]
    }()
    var buttonSelectImage:[String] = {
       return ["tabbar_home_selected","tabbar_message_center_selected","tabbar_discover_selected","tabbar_profile_selected"]
    }()
    var buttonHightlightImage:[String] = {
       return ["tabbar_home_highlighted","tabbar_message_center_highlighted","tabbar_discover_highlighted","tabbar_profile_highlighted"]
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
