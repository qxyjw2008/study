//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/25/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,JSAnimatedImagesViewDataSource {

    @IBOutlet weak var loginImage: JSAnimatedImagesView!
    @IBOutlet weak var loginStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginImage.dataSource = self
    }
    
    @IBAction func submitBtn(sender: UIButton) {
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
    
}
