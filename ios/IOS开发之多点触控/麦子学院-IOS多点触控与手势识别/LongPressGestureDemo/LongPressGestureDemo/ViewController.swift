//
//  ViewController.swift
//  LongPressGestureDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //长按调用
    @IBAction func longPreeGesture(sender: UILongPressGestureRecognizer) {
        if sender.state == .Began {
            print("long press began...")
            let alertController = UIAlertController(title: "LongPress", message: "你长按了", preferredStyle: .Alert)
            let alert = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) -> Void in
                print("长按了")
            }
            alertController.addAction(alert)
            self.presentViewController(alertController, animated: true) { () -> Void in
                print("finished...")
            }
        }
        if sender.state == .Ended {
            print("long press end...")
        }
    }

}

