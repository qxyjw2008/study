//
//  VerifyPhonePage.swift
//  Uber
//
//  Created by Benjamin on 1/11/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class VerifyPhonePage: FxBasePage {

    @IBOutlet var verifyNumberTextFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "确认手机"
        setNavigationItem("Close.png", selector: "doBack", isRight: false)
        for textField in verifyNumberTextFields {
            if textField.tag == 1 {
                textField.becomeFirstResponder()
            }
        }
    }
    
    @IBAction func numberChanged(sender: UITextField) {
        let tag = sender.tag
        
        if sender.text!.isEmpty {
            if tag > 1 {
                let preField = self.view.viewWithTag(tag-1) as! UITextField
                preField.becomeFirstResponder()
            }
        } else {
            if tag < 4 {
                let nextField = self.view.viewWithTag(tag+1) as! UITextField
                nextField.becomeFirstResponder()
            } else if tag == 4 {
                sender.resignFirstResponder()
                doVerify()
            }
        }
    }

    func doVerify() {
        SVProgressHUD.showInfoWithStatus("验证中")
        self.performSelector(Selector("gotoHomePage"), withObject: nil, afterDelay: 1.0)
    }
    
    func gotoHomePage() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.showHomePage()
    }
    
    @IBAction func resendVerifyNumber(sender: UIButton) {
        
    }
    
    @IBAction func ChangePhoneNumber(sender: UIButton) {
    }
    
    override func doBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
