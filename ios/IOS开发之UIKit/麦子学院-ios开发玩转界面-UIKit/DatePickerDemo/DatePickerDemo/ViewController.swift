//
//  ViewController.swift
//  DatePickerDemo
//
//  Created by Benjamin on 11/5/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func datePicker1(sender: UIDatePicker) {
        let format = NSDateFormatter()
        format.dateFormat = "yyyy年MM月dd日 HH时mm分ss秒"
        let formatDate = format.stringFromDate(sender.date)
        print(formatDate)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

