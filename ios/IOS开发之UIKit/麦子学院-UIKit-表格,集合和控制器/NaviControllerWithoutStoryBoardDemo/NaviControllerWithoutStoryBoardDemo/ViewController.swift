//
//  ViewController.swift
//  NaviControllerWithoutStoryBoardDemo
//
//  Created by Benjamin on 11/13/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,passValue {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        self.navigationItem.title = "VC1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: "add")
    }

    func sendValue(value: String) {
        let tempLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 230, height: 40))
        tempLabel.text = value
        self.view.addSubview(tempLabel)
    }
    
    func add() {
        let vc2 = ViewController2()
        vc2.name = "ViewController1传来的值"
        vc2.delegate = self
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

