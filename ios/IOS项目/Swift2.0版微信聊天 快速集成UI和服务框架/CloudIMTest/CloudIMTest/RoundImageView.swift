//
//  RoundImageView.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/25/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

/// 实时渲染自定义类
@IBDesignable
class RoundImageView: UIImageView {

    /// 自定义圆角半径
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    /// 自定义边框宽度
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    /// 自定义边框颜色
    @IBInspectable var borderColor: UIColor? {
        didSet{
            layer.borderColor = borderColor?.CGColor
        }
    }
}
