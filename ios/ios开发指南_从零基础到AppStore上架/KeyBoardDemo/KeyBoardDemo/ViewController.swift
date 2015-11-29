//
//  ViewController.swift
//  KeyBoardDemo
//
//  Created by Benjamin on 11/15/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var textView1: UITextView!

    @IBOutlet weak var textField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        print("view did load...")
    }
    
    override func viewWillAppear(animated: Bool) {
        print("view will appear...")
        //注册键盘出现通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        //注册键盘隐藏通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidHide:", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("view will disappear...")
        //解除键盘出现通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        //解除键盘隐藏通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        print("键盘打开")
    }
    
    func keyboardDidHide(notification: NSNotification) {
        print("键盘关闭")
    }
    
    //用户按回车触发
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //用户点击空白处触发
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        textField1.resignFirstResponder()
        textView1.resignFirstResponder()
    }
}

