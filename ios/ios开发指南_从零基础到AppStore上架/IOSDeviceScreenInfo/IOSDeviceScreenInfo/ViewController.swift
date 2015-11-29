//
//  ViewController.swift
//  IOSDeviceScreenInfo
//
//  Created by Benjamin on 11/15/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDeviceScreenInfo()
    }
    
    //获取各个设备的信息
    func getDeviceScreenInfo() {
        let iosDeviceScreenSize = UIScreen.mainScreen().bounds.size
        let info = "device width: \(iosDeviceScreenSize.width) and height: \(iosDeviceScreenSize.height)"
        print(info)
        
        if iosDeviceScreenSize.height > iosDeviceScreenSize.width {
            //竖屏情况
            if iosDeviceScreenSize.height == 568 {
                print("iphone 5/5s/5c(iPod touch 5)设备")
            } else if iosDeviceScreenSize.height == 667 {
                print("iphone6设备")
            } else if iosDeviceScreenSize.height == 736 {
                print("iphone6 Plus 设备")
            } else {
                print("iphone 4s等其他设备")
            }
        }
        if iosDeviceScreenSize.width > iosDeviceScreenSize.height {
            //横屏情况
            if iosDeviceScreenSize.width == 568 {
                print("iphone 5/5s/5c(iPod touch 5)设备")
            } else if iosDeviceScreenSize.width == 667 {
                print("iphone6设备")
            } else if iosDeviceScreenSize.width == 736 {
                print("iphone6 Plus 设备")
            } else {
                print("iphone 4s等其他设备")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

