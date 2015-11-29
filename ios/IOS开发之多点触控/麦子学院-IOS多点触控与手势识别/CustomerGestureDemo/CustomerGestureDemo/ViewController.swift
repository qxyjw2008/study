//
//  ViewController.swift
//  CustomerGestureDemo
//
//  Created by Benjamin on 11/17/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.addGestureRecognizer(CustomerGesture(target: self, action: "customGesture:"))
    }
    
    func customGesture(sender: UIGestureRecognizer) {
        print("识别成功")
    }

}

