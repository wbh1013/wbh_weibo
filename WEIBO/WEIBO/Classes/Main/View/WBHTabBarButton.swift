//
//  WBHTabBarButton.swift
//  WEIBO
//
//  Created by hjy on 2017/11/20.
//  Copyright © 2017年 baohong. All rights reserved.
//

import UIKit

class WBHTabBarButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.titleLabel?.textAlignment = NSTextAlignment.center
    }
//MARK - 重新方法设置文字的frame
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: contentRect.size.height * 0.7-3, width: contentRect.size.width, height: contentRect.size.height * 0.3)
    }
    
//MARK - 重新方法设置图片的frame
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageHight = contentRect.size.height * 0.6
        let imageWidth = imageHight
        let imageX     = (contentRect.size.width - imageWidth ) / 2
        return CGRect(x: imageX, y: 4, width: imageWidth, height: imageHight)
    }
    
//MARK - 重新方法去除高亮状态
    override var isHighlighted: Bool{
        set{
            
        }
        get{
            return  false
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
