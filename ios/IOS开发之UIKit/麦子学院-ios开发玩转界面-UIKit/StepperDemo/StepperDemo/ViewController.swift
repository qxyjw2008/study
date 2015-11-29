//
//  ViewController.swift
//  StepperDemo
//
//  Created by Benjamin on 11/4/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var textField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.text = "\(stepper1.value)"
    }

    @IBAction func stepperClick(sender: UIStepper) {
        textField1.text = "\(sender.value)"
//        textField1.text = NSString(format: "%g", sender.value) as String
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

