//
//  ViewController.swift
//  pickViewDemo2
//
//  Created by Benjamin on 11/6/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var pickerView1: UIPickerView!
    
    let province = ["广西", "广东", "江苏", "四川"]
    let city = ["广西":["南宁", "北海", "桂林", "柳州"], "广东": ["东莞", "广州", "佛山"], "江苏": ["南京", "宿迁", "徐州", "泰州", "扬州"], "四川": ["成都", "绵阳", "广元", "宜宾"]]
    var selectValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1.dataSource = self
        pickerView1.delegate = self
    }

    //列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    //行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return province.count
        } else {
            if city[selectValue] != nil {
                return city[selectValue]!.count
            } else {
                return 0
            }
        }
    }
    
    //title
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return province[row]
        } else {
            if city[selectValue] != nil {
                return city[selectValue]![row]
            } else {
                return "?"
            }
        }
    }
    
    //select
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectValue = province[row]
            pickerView1.reloadComponent(1)
            //让每次选择第二列重新选择第一行
            pickerView1.selectRow(0, inComponent: 1, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

