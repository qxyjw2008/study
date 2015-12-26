//
//  ViewController.swift
//  PopDemo
//
//  Created by Benjamin on 12/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redDiamonds: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redDiamonds = UIView(frame: CGRectMake(0, 100, 50, 50))
        redDiamonds.center.x = self.view.center.x
        redDiamonds.backgroundColor = UIColor.redColor()
        self.view.addSubview(redDiamonds)
    }

    @IBAction func basicAnimation(sender: UIButton) {
        let basicPop = POPBasicAnimation(propertyNamed: kPOPLayerPositionX)
        basicPop.fromValue = 50
        basicPop.toValue = 200
        basicPop.duration = 2
        basicPop.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        self.redDiamonds.pop_addAnimation(basicPop, forKey: "basic")
    }

    @IBAction func springAnimation(sender: UIButton) {
        let springPop = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        springPop.fromValue = 50
        springPop.toValue = 200
        
        // 下面两个配合使用
        // 范围都是[0, 20]. springSpeed默认12， springBounciness默认4
        springPop.springSpeed = 10
        springPop.springBounciness = 10
        
        springPop.dynamicsTension = 10  // 拉力
        springPop.dynamicsFriction = 10 // 摩擦力
        springPop.dynamicsMass = 10     // 质量
        self.redDiamonds.pop_addAnimation(springPop, forKey: "")
    }
    
    @IBAction func decayAnimation(sender: UIButton) {
        let decayPop = POPDecayAnimation(propertyNamed: kPOPLayerPositionY)
        decayPop.velocity = 600
//        decayPop.beginTime = CACurrentMediaTime() + 1
        self.redDiamonds.pop_addAnimation(decayPop, forKey: "benjamin真帅")
    }
}

