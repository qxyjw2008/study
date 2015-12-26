//
//  ViewController.swift
//  PopDemo2
//
//  Created by Benjamin on 12/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        springAnimate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func springAnimate() {
        let layer = CALayer()
        layer.frame = CGRectMake(0, 0, 50, 50)
        layer.backgroundColor = UIColor.cyanColor().CGColor
        layer.cornerRadius = 25.0
        layer.position = self.view.center
        self.view.layer.addSublayer(layer)
        
        let springAnima = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        springAnima.toValue = 50
        springAnima.springSpeed = 0.0
        layer.pop_addAnimation(springAnima, forKey: "scalXY")
        
    }
}

