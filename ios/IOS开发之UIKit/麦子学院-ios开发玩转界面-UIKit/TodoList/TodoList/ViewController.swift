//
//  ViewController.swift
//  TodoList
//
//  Created by Benjamin on 10/28/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var indexPath = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label1.text = "RowIndex is \(indexPath)"
    }

    @IBOutlet weak var label1: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

