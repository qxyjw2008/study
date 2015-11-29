//
//  ViewController.swift
//  SandboxDemo
//
//  Created by Benjamin on 11/17/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1.Home目录，即沙盒目录
        var path = NSHomeDirectory()
        print("Home: \(path)")
        
        // 2.Documents目录
        path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        print("Document: \(path)")
        
        // 3.Library目录
        path = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first!
        print("Library: \(path)")
        
        // 4.Caches目录
        path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        print("Caches: \(path)")
        
        // 5.tmp目录
        path = NSTemporaryDirectory()
        print("tmp: \(path)")
    }

}

