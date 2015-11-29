//
//  CustomerGesture.swift
//  CustomerGestureDemo
//
//  Created by Benjamin on 11/17/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

//自定义斜线手势识别
class CustomerGesture: UIGestureRecognizer {
    
    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    var leftTop = false
    var rightButtom = false
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        leftTop = false
        rightButtom = false
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        if let touch = touches.first {
            let myLocation = touch.locationInView(self.view)
            if myLocation.x < 10 && myLocation.y < 10 {
                leftTop = true
            }
            if (myLocation.x + 10) > self.view!.bounds.width && (myLocation.y + 10) > self.view?.bounds.height {
                rightButtom = true
            }
            if leftTop && rightButtom {
                //手势识别成功
                self.state = UIGestureRecognizerState.Ended
            }
        }
        super.touchesMoved(touches, withEvent: event)
    }

}
