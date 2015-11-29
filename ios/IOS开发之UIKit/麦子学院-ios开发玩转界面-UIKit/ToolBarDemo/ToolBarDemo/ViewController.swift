//
//  ViewController.swift
//  ToolBarDemo
//
//  Created by Benjamin on 11/6/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addBarButton1: UIBarButtonItem!
    @IBOutlet weak var toolBar1: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        let textField1 = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        textField1.backgroundColor = UIColor.whiteColor()
        textField1.borderStyle = .RoundedRect
        let buttonItem1 = UIBarButtonItem(customView: textField1)
        //增加一个textfield，先放在UIBarButtonItem里面
        toolBar1.items?.append(buttonItem1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

