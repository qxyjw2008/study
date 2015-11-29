//
//  ViewController.swift
//  LoginDemo
//
//  Created by Benjamin on 10/31/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetAction(sender: AnyObject) {
        userName.text = ""
        password.text = ""
    }
    @IBAction func loginAction(sender: AnyObject) {
        if userName.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == "benjamin" && password.text == "wheet123" {
            print("登录成功")
        } else {
            print("登录失败")
        }
    }
    @IBAction func userNameExit(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    @IBAction func passwordExit(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

