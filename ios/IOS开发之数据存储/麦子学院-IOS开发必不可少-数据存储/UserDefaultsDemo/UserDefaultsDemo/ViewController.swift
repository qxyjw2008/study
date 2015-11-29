//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

//用户首选项
class ViewController: UIViewController {
    
    let refreshInterval: NSTimeInterval = 10
    let refreshKey = "LastRefreshTime"
    let userDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(NSHomeDirectory())")
        
        if shouldRefresh() {
            refresh()
        } else {
            print("load caches...")
        }
    }

    func refresh() {
        print("refresh...")
        resetRefreshTime()
    }
    
    //check for refresh
    func shouldRefresh() -> Bool {
        guard let date = (userDefaults.objectForKey(refreshKey) as? NSDate) else{
            return true
        }
        return NSDate().timeIntervalSinceDate(date) > refreshInterval
    }
    
    //reset the last refresh time
    func resetRefreshTime() {
        userDefaults.setObject(NSDate(), forKey: refreshKey)
        userDefaults.synchronize()
    }
    
}

