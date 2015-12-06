//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/25/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit
import JSAnimatedImagesView

class LoginViewController: UIViewController,JSAnimatedImagesViewDataSource {

    @IBOutlet weak var loginImage: JSAnimatedImagesView!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var labelUsername: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginImage.dataSource = self
    }
    
    @IBAction func submitBtn(sender: UIButton) {
        let username = labelUsername.text
        let password = labelPassword.text
        
        if username != "" && password != "" {
            let query = AVQuery(className: "XYuser")
            query.whereKey("username", equalTo: username)
            query.whereKey("password", equalTo: password)
            query.getFirstObjectInBackgroundWithBlock { (object, e) -> Void in
                if object != nil {
                    //提示登录成功
                    self.noticeSuccess("登录成功", autoClear: true, autoClearTime: 1)
                    self.performSegueWithIdentifier("toConversationList", sender: self)
                } else {
                    //提示用户名密码不存在
                    self.noticeError("登录失败",autoClear: true, autoClearTime: 2)
                    self.labelUsername.text = ""
                    self.labelPassword.text = ""
                    self.labelUsername.becomeFirstResponder()
                }
            }
        } else {
            self.labelUsername.becomeFirstResponder()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "image\(index+1)")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //页面加载完成后动画显示水平方向转垂直方向
        UIView.animateWithDuration(1) { () -> Void in
            self.loginStackView.axis = .Vertical
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue")
    }
    
}
