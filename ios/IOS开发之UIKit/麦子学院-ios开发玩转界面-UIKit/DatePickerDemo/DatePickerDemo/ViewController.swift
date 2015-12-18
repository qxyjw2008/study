//
//  ViewController.swift
//  DatePickerDemo
//
//  Created by Benjamin on 11/5/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var pickerView1: UIPickerView!
    var book = ["IOS开发", "JAVA实践"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1.delegate = self
        pickerView1.dataSource = self
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return book.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return book[row]
    }


}

