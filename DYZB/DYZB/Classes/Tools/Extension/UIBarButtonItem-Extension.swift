//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by 1 on 16/9/14.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
        
        btn.frame = CGRect(origin: CGPointZero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSizeZero)  {
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), forState: .Highlighted)
        }
        
        // 3.设置btn的尺寸
        if size == CGSizeZero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPointZero, size: size)
        }
        
        // 4.创建UIBarButtonItem
        self.init(customView : btn)
    }
    
}
