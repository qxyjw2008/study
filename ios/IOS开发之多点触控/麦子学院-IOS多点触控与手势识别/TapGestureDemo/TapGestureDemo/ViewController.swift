//
//  ViewController.swift
//  TapGestureDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tapGesture1: UITapGestureRecognizer!
    @IBAction func greenViewTap(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(self.view)
        print("点击了x: \(point.x), y: \(point.y)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置双击
        tapGesture1.numberOfTapsRequired = 2
        //设置多点触控(在模拟器按住option点击)
        tapGesture1.numberOfTouchesRequired = 2
    }
}

