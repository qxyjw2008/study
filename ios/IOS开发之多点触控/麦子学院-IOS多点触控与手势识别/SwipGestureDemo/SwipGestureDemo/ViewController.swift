//
//  ViewController.swift
//  SwipGestureDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var offsetX: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func swipGesture(sender: UISwipeGestureRecognizer) {
        offsetX += 20
        print(offsetX)
        //如果向右滑动，设置滑动距离
        if sender.direction == UISwipeGestureRecognizerDirection.Right {
            sender.view!.transform = CGAffineTransformMakeTranslation(offsetX, 0)
        }
        
    }
    
}

