//
//  ViewController.swift
//  RotationGestureDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rotationGesture(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformMakeRotation(sender.rotation)
    }

}

