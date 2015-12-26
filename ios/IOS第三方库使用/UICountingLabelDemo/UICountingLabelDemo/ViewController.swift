//
//  ViewController.swift
//  UICountingLabelDemo
//
//  Created by Benjamin on 12/18/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myLabel = UICountingLabel(frame: CGRectMake(100, 100, 100, 40))
        myLabel.format = "%d"
        myLabel.method = .Linear
        // 从50 加动到100，2秒内
        myLabel.countFrom(50, to: 100, withDuration: 2.0)
        
        myLabel.animationDuration = 10.0
        myLabel.backgroundColor = UIColor.redColor()
        self.view.addSubview(myLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

