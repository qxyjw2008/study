//
//  ViewController.swift
//  ViewAnimationDemo
//
//  Created by Benjamin on 11/13/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blankView1: UIView!
    @IBOutlet weak var blankView2: UIView!
    var originFrame: CGRect!
    var originFrame2: CGRect!
    
    var view1SubView: UIView!
    var originFrameSubView = CGRect(x: 5, y: 5, width: 60, height: 60)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originFrame = self.blankView1.frame
        originFrame2 = self.blankView2.frame
        view1SubView = UIView(frame: self.originFrameSubView)
        view1SubView.backgroundColor = UIColor.redColor()
        blankView1.addSubview(view1SubView)
    }

    @IBAction func startBtnClicked(sender: UIButton) {
//        self.basicAnimation()
//        self.optionAnimation()
//        self.beginCommitAnimation()
        
//        self.operateSubView()
        
        self.replaceView()
    }

    @IBAction func fallbackBtnClicked(sender: UIButton) {
        self.blankView1.frame = originFrame
        self.blankView2.frame = originFrame2
        self.view1SubView.frame = originFrameSubView
        self.blankView1.layer.removeAllAnimations()
    }
    
    func basicAnimation() {
        UIView.animateWithDuration(1) { () -> Void in
            self.blankView1.frame.origin.x += 100
        }
    }
    
    //推荐使用动画block方式
    func optionAnimation() {
        //swift2.0之前options可以这么写UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat
        UIView.animateWithDuration(2.0, delay: 0.0, options: [UIViewAnimationOptions.CurveLinear,UIViewAnimationOptions.Repeat], animations: { () -> Void in
            self.blankView1.frame.origin.x += 100
            //子类动画
            UIView.animateWithDuration(2.0, delay: 0.0, options: [UIViewAnimationOptions.OverrideInheritedDuration, UIViewAnimationOptions.CurveEaseOut, UIViewAnimationOptions.OverrideInheritedCurve], animations: { () -> Void in
                self.blankView2.frame.origin.x += 100
                }, completion: { (finish) -> Void in
                    print("inner animation finished...")
            })
            
            }) { (finish) -> Void in
                print("outter animation finished...")
        }
    }
    
    //不推荐使用begin commit方式
    func beginCommitAnimation() {
        //声明动画属性
        UIView.beginAnimations("testAnimate", context: nil)
        UIView.setAnimationDuration(2.0)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStartSelector("animationDidStart:")
        UIView.setAnimationDidStopSelector("animationDidStop:finished:")
        
        //执行动画
        self.blankView1.backgroundColor = UIColor.magentaColor()
        //提交动画
        UIView.commitAnimations()
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("start animation...")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("finished animation...")
    }
    
    func operateSubView() {
        UIView.transitionWithView(blankView1, duration: 1.0, options: [UIViewAnimationOptions.AllowAnimatedContent, UIViewAnimationOptions.TransitionFlipFromBottom], animations: { () -> Void in
                self.view1SubView.frame.origin.x += 160
            }) { (finish) -> Void in
                print("finished...")
        }
    }
    
    //替换视图
    func replaceView() {
        let replaceView = UIView(frame: CGRect(x: 50, y: 300, width: 280, height: 60))
        replaceView.backgroundColor = UIColor.purpleColor()
        UIView.transitionFromView(blankView2, toView: replaceView, duration: 2.0, options: [UIViewAnimationOptions.TransitionCurlUp]) { (finish) -> Void in
            print("finished...")
        }
    }
}

