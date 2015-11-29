//
//  ViewController.swift
//  UIControlDemo
//
//  Created by Benjamin on 10/31/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmented1: UISegmentedControl!
    @IBOutlet weak var textField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func textField2Action(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func buttonAddClick(sender: AnyObject) {
        self.segmented1.insertSegmentWithTitle(self.textField1.text, atIndex: self.segmented1.numberOfSegments, animated: true)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.blackColor()
        case 2:
            self.view.backgroundColor = UIColor.whiteColor()
        case 3:
            self.view.backgroundColor = UIColor.blueColor()
        case 4:
            self.view.backgroundColor = UIColor.yellowColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

