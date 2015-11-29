//
//  ViewController.swift
//  PinchGuestureDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func pinchGuesture(sender: UIPinchGestureRecognizer) {
        print("缩放触发scale: \(sender.scale)")
        let _height = greenView.bounds.height
        let _width = greenView.bounds.width
        greenView.bounds.size = CGSizeMake(_width*sender.scale, _height*sender.scale)
//        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
    }
}

