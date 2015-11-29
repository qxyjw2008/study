//
//  ViewController.swift
//  ProgressDemo
//
//  Created by Benjamin on 11/4/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progress1: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress1.value = 0
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "performProgress:", userInfo: nil, repeats: true)
    }

    func performProgress(sender: NSTimer) {
        progress1.value += 0.1
        if (progress1.value <= 0.4) {
            progress1.minimumTrackTintColor = UIColor.greenColor()
        } else if (progress1.value <= 0.8) {
            progress1.minimumTrackTintColor = UIColor.yellowColor()
        } else if (progress1.value <= 0.9) {
            progress1.minimumTrackTintColor = UIColor.redColor()
        } else {
            sender.invalidate()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

