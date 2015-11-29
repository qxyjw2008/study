//
//  ViewController2.swift
//  NaviControllerWithoutStoryBoardDemo
//
//  Created by Benjamin on 11/13/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var name: String?
    var delegate: passValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        self.navigationItem.title = "VC2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: "add")
        showLabel()
    }

    func showLabel() {
        let tempLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 230, height: 40))
        tempLabel.text = name
        self.view.addSubview(tempLabel)
    }
    
    func add() {
        delegate?.sendValue("ViewController2传来的值")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
