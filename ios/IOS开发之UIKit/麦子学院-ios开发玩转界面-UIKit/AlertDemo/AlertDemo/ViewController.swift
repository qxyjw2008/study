//
//  ViewController.swift
//  AlertDemo
//
//  Created by Benjamin on 11/4/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ClickAlertBtn(sender: UIButton) {
        //ios8以后就不用UIAlertView了。
        let alertView1 = UIAlertView(title: "确认关闭么?", message: "是否关闭当前窗体", delegate: self, cancelButtonTitle: "确认",
            otherButtonTitles: "取消")
        alertView1.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        let loginTextField = alertView1.textFieldAtIndex(0)
        loginTextField?.borderStyle = .RoundedRect
        loginTextField?.placeholder = "请输入用户名"
        let passwordTextField = alertView1.textFieldAtIndex(1)
        passwordTextField?.borderStyle = .RoundedRect
        passwordTextField?.placeholder = "请输入密码"
        passwordTextField?.secureTextEntry = true
        alertView1.show()
        //io8以后这么使用
//        let alert = UIAlertController(title: "确认关闭么?", message: "是否关闭当前窗体", preferredStyle: UIAlertControllerStyle.Alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {(action)in})
//        alert.addAction(cancelAction)
//        self.presentViewController(alert, animated: true){
//        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        let login = alertView.textFieldAtIndex(0)?.text
        UIAlertView(title: "login", message: "value is \(login!)", delegate: nil, cancelButtonTitle: "确定").show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

