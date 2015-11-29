//
//  ViewController.swift
//  PanGestureDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //平移
    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        let transX = sender.translationInView(sender.view).x
        let transY = sender.translationInView(sender.view).y
        sender.view!.transform = CGAffineTransformMakeTranslation(transX, transY)
    }
}

