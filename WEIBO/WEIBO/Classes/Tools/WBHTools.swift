//
//  WBHTools.swift
//  PlamBI
//
//  Created by hjy on 2017/9/6.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

class WBHTools: NSObject {

    
    class func colorWithHexString(hexString:String) -> UIColor{
        let colorStr = (hexString as NSString).replacingOccurrences(of: "#", with: "")
        var alpha:Float
        var red:Float
        var blue:Float
        var green:Float

        switch colorStr.characters.count {
        case 3:// #RGB
            alpha = 1.0
            red   = self.colorComponentFrom(colorString: colorStr, start: 0, lenght: 1)
            green = self.colorComponentFrom(colorString: colorStr, start: 1, lenght: 1)
            blue  = self.colorComponentFrom(colorString: colorStr, start: 2, lenght: 1)
        case 4: // #ARGB
            alpha = self.colorComponentFrom(colorString: colorStr, start: 0, lenght: 1)
            red   = self.colorComponentFrom(colorString: colorStr, start: 1, lenght: 1)
            green = self.colorComponentFrom(colorString: colorStr, start: 2, lenght: 1)
            blue  = self.colorComponentFrom(colorString: colorStr, start: 3, lenght: 1)
        case 6:// #RRGGBB
            alpha = 1.0
            red   = self.colorComponentFrom(colorString: colorStr, start: 0, lenght: 2)
            green = self.colorComponentFrom(colorString: colorStr, start: 2, lenght: 2)
            blue  = self.colorComponentFrom(colorString: colorStr, start: 4, lenght: 2)
        case 8:// #AARRGGBB
            alpha = self.colorComponentFrom(colorString: colorStr, start: 0, lenght: 2)
            red   = self.colorComponentFrom(colorString: colorStr, start: 2, lenght: 2)
            green = self.colorComponentFrom(colorString: colorStr, start: 4, lenght: 2)
            blue  = self.colorComponentFrom(colorString: colorStr, start: 6, lenght: 2)
        default:
            return UIColor.black
            
        }
//        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        return UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha));
    }
    

    // 有颜色生成图片
    class func createImageWithCorlor(color:UIColor) -> UIImage{
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    private class func colorComponentFrom(colorString:String,start:NSInteger,lenght:NSInteger) -> Float{
        let subSting = (colorString as NSString).substring(with: NSMakeRange(start, lenght))
        let fullHex  = (lenght == 2) ? subSting : "\(subSting)\(subSting)"
        var hexComponet:CUnsignedInt = 0
        Scanner(string: fullHex).scanHexInt32(&hexComponet)
        return Float(hexComponet) / 255.0
    }
    
}
