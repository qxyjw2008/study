//
//  ViewController.swift
//  RecognizerDemo
//
//  Created by Benjamin on 11/16/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    //在view上点击触发
    func view1Tap(sender: UITapGestureRecognizer) {
        print("view1 clicked...")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //建立手势识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: "view1Tap:")
        //附加视图
        view1.addGestureRecognizer(tapGesture)
        
    }

}

