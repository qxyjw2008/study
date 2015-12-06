//
//  ViewController.swift
//  自定义Tabbar中间按钮
//
//  Created by Benjamin on 12/6/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIViewController()
        view1.view.backgroundColor = UIColor.redColor()
        view1.tabBarItem.title = "首页"
        view1.tabBarItem.image = UIImage(named: "tabbar_company_home")
        view1.tabBarItem.selectedImage = UIImage(named: "tabbar_company_home_select")
        
        let view2 = UIViewController()
        view2.view.backgroundColor = UIColor.greenColor()
        view2.tabBarItem.title = "动态"
        view2.tabBarItem.image = UIImage(named: "tabbar_dynamic")
        view2.tabBarItem.selectedImage = UIImage(named: "tabbar_dynamic_selected")
        
        let view3 = UIViewController()
        view3.view.backgroundColor = UIColor.blueColor()
        self.addCenterButtonWithImage(UIImage(named: "middleImage"), highlightImage: nil)
        
        let view4 = UIViewController()
        view4.view.backgroundColor = UIColor.grayColor()
        view4.tabBarItem.title = "广场"
        view4.tabBarItem.image = UIImage(named: "tabbar_position_oringin")
        view4.tabBarItem.selectedImage = UIImage(named: "tabbar_position_selected")
        
        let view5 = UIViewController()
        view5.view.backgroundColor = UIColor.purpleColor()
        view5.tabBarItem.title = "我的"
        view5.tabBarItem.image = UIImage(named: "tabbar_mine_oringin")
        view5.tabBarItem.selectedImage = UIImage(named: "tabbar_mine_selected")
        
        self.viewControllers = [view1, view2, view3, view4, view5]
        
    }
    
    func addCenterButtonWithImage(buttonImage: UIImage?, highlightImage: UIImage?) {
        let button = UIButton(type: .Custom)
        button.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin]
        button.frame = CGRectMake(0, 0, buttonImage!.size.width, buttonImage!.size.height)
        button.addTarget(self, action: "buttonClick", forControlEvents: .TouchUpInside)
        button.setBackgroundImage(buttonImage, forState: .Normal)
        button.setBackgroundImage(highlightImage, forState: .Highlighted)
        let heightDifference = buttonImage!.size.height - self.tabBar.frame.size.height
        //让图片的中心在tabbar的中间。不加这个图片默认在view的左上角
        if heightDifference < 0 {
            button.center = self.tabBar.center
        } else {
            var center = self.tabBar.center
            center.y = center.y - heightDifference/2.0
            button.center = center
        }
        self.view.addSubview(button)
    }
    
    func buttonClick() {
        print("点击了中间按钮")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

