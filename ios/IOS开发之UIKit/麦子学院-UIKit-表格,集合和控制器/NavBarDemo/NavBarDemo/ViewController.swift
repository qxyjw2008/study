//
//  ViewController.swift
//  NavBarDemo
//
//  Created by Benjamin on 11/13/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var naviItem1: UINavigationItem!
    @IBOutlet weak var naviBar1: UINavigationBar!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        naviItem1.backBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "back")
    }

    @IBAction func addClick(sender: UIBarButtonItem) {
        add()
    }
    
    func add() {
        print("add...")
        count++
        let item = UINavigationItem(title: "Count: \(count)")
        item.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "back")
        item.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
        naviBar1.pushNavigationItem(item, animated: true)
    }
    func back() {
        print("back...")
        count--
        naviBar1.popNavigationItemAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

