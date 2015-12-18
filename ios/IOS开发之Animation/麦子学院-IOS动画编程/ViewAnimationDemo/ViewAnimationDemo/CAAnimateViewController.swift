//
//  CAAnimateViewController.swift
//  ViewAnimationDemo
//
//  Created by Benjamin on 11/14/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class CAAnimateViewController: UIViewController {

    let myLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.testLayerProperty()
    }
    @IBAction func startBtnClicked(sender: UIButton) {
//        self.implicitAnimation()
        self.explicitAnimation()
//        self.curveKeyFrameAnimation()
//        self.normalKeyFrameAnimation()
    }

    @IBAction func fallbackBtnClicked(sender: UIButton) {
        for view in self.view.subviews {
            if view .isKindOfClass(UIImageView) {
                view.removeFromSuperview()
            }
        }
    }
    
    @IBAction func stopBtnClicked(sender: UIButton) {
    }
    
    func testLayerProperty() {
        myLayer.backgroundColor = UIColor.magentaColor().CGColor
        myLayer.borderColor = UIColor.orangeColor().CGColor
        myLayer.borderWidth = 5.0
        //拐角半径
        myLayer.cornerRadius = 10.0
        myLayer.shadowColor = UIColor.whiteColor().CGColor
        myLayer.shadowOffset = CGSize(width: 25.0, height: 25.0)
        myLayer.shadowOpacity = 0.5
        myLayer.shadowRadius = 10.0
        myLayer.frame = CGRectMake(100, 100, 100, 100)
        
        self.view.layer.addSublayer(myLayer)
    }
    
    //隐式动画
    func implicitAnimation() {
        myLayer.position.y += 30
    }
    
    //显式动画
    func explicitAnimation() {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.frame = CGRectMake(150, 200, 100, 100)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        self.view.addSubview(imageView)
        
        let imageLayer = imageView.layer
        
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 0.8
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 2.0
        
//        let opaqueAnimate = CABasicAnimation(keyPath: "opacity")
//        opaqueAnimate.fromValue = 0.0
//        opaqueAnimate.toValue = 1.0
//        opaqueAnimate.autoreverses = true
//        opaqueAnimate.duration = 1.0
//        opaqueAnimate.repeatCount = MAXFLOAT
        
        
        imageLayer.addAnimation(scaleAnimate, forKey: "scaleAnimate")
//        imageLayer.addAnimation(opaqueAnimate, forKey: "opaqueAnimate")
        
    }
    
    //走矩形路线
    func normalKeyFrameAnimation() {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.frame = CGRectMake(150, 200, 40, 40)
        self.view.addSubview(imageView)
        
        let imagelayer = imageView.layer
        
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        let imagePosition = imagelayer.position
        let imagePositionX = imagePosition.x
        let imagePositionY = imagePosition.y
        
        let value0 = NSValue(CGPoint: imagePosition)
        let value1 = NSValue(CGPoint: CGPointMake(imagePositionX, imagePositionY + 200))
        let value2 = NSValue(CGPoint: CGPointMake(imagePositionX - 150, imagePositionY + 200))
        let value3 = NSValue(CGPoint: CGPointMake(imagePositionX - 150, imagePositionY))
        let value4 = NSValue(CGPoint: imagelayer.position)
        keyAnimate.values = [value0, value1, value2, value3, value4]
        
        //设置每段路线的运行方式
        let tf0 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        let tf1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let tf2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let tf3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        keyAnimate.timingFunctions = [tf0, tf1, tf2, tf3]
        
        //每段的执行时间
        //每相邻的两个数越小，执行越快 范围[0.0, 1.0]
        keyAnimate.keyTimes = [0.0, 0.2, 0.5, 0.6, 1.0]
        
        keyAnimate.duration = 6.0
        keyAnimate.repeatCount = MAXFLOAT
        imagelayer.addAnimation(keyAnimate, forKey: "keyAnimate")
    }
    
    //曲线
    func curveKeyFrameAnimation() {
        let imageView = UIImageView(image: UIImage(named: "2"))
        imageView.frame = CGRectMake(150, 200, 40, 40)
        self.view.addSubview(imageView)
        let imageLayer = imageView.layer
        let thePath = CGPathCreateMutable()
        let screenSize = UIScreen.mainScreen().bounds.size
        CGPathMoveToPoint(thePath, nil, 74.0, screenSize.height-74.0)
        CGPathAddCurveToPoint(thePath, nil, 74.0, screenSize.height-300.0, 150.0, screenSize.height-300.0, 226.0, screenSize.height-74.0)
//        CGPathAddCurveToPoint(thePath, nil, 320.0, 500.0, 566.0, 500.0, 566.0, 74.0)
        let theAnimate = CAKeyframeAnimation(keyPath: "position")
        theAnimate.duration = 2.0
        theAnimate.path = thePath
        theAnimate.autoreverses = true
        theAnimate.repeatCount = MAXFLOAT
        imageLayer.addAnimation(theAnimate, forKey: "theAnimate")
    }
}
