//
//  ViewController.swift
//  swipGestureDemo
//
//  Created by Benjamin on 12/3/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = UIScreen.mainScreen().bounds
        let view1 = UIView(frame: rect)
        self.view.addSubview(view1)
        view1.backgroundColor = UIColor.greenColor()
        let leftSwipGesture = UISwipeGestureRecognizer(target: self, action: "swipAction:")
        let rightSwipGesture = UISwipeGestureRecognizer(target: self, action: "swipAction:")
        leftSwipGesture.direction = .Left
        rightSwipGesture.direction = .Right
        view1.addGestureRecognizer(leftSwipGesture)
        view1.addGestureRecognizer(rightSwipGesture)
    }
    
    func swipAction(sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizerDirection.Left {
            print("往左滑")
        } else {
            print("往右滑")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

