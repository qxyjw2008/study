//
//  FxBasePage.swift
//  Uber
//
//  Created by Benjamin on 1/2/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class FxBasePage: FxBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /**
     设置导航栏默认样式
     
     - parameter title:    标题（如果以.png结尾，则设置为图片）
     - parameter selector: 方法调用
     - parameter isRight:  是否添加到右边
     */
    func setNavigationItem(title: String, selector: Selector, isRight: Bool) {
        let item: UIBarButtonItem!
        
        if title.hasSuffix(".png") {
            item = UIBarButtonItem(image: UIImage(named: title), style: .Plain, target: self, action: selector)
        } else {
            item = UIBarButtonItem(title: title, style: .Plain, target: self, action: selector)
        }
        
        item.tintColor = UIColor.darkGrayColor()
        
        if isRight {
            self.navigationItem.rightBarButtonItem = item
        } else {
            self.navigationItem.leftBarButtonItem = item
        }
    }

    func doBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doNext() {
    }
}
