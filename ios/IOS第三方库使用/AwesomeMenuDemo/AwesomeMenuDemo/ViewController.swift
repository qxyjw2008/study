//
//  ViewController.swift
//  AwesomeMenuDemo
//
//  Created by Benjamin on 12/18/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AwesomeMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyMenuImage = UIImage(named: "bg-menuitem.png")
        let storyMenuImagePressed = UIImage(named: "bg-menuitem-highlighted")
        let starImage = UIImage(named: "icon-star")
        
        let item1 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: starImage, highlightedContentImage: nil)
        let item2 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: starImage, highlightedContentImage: nil)
        let item3 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: starImage, highlightedContentImage: nil)
        let item4 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: starImage, highlightedContentImage: nil)
        let item5 = AwesomeMenuItem(image: storyMenuImage, highlightedImage: storyMenuImagePressed, contentImage: starImage, highlightedContentImage: nil)
        
        let addMenu = AwesomeMenuItem(image: UIImage(named: "bg-addbutton"), highlightedImage: UIImage(named: "bg-addbutton-highlighted"), contentImage: UIImage(named: "icon-plus"), highlightedContentImage: UIImage(named: "icon-plus-highlighted"))
        
        let menu = AwesomeMenu(frame: self.view.frame, startItem: addMenu, menuItems: [item1, item2, item3, item4, item5])
        
        // declare property 
        // 主item的位置
        menu.startPoint = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
        
        // 旋转角度(第一个item到最后一个item的方向由 上-右->下->左 偏移了rotateAngle度)
        menu.rotateAngle = -CGFloat(M_PI)/2
        
        // 展开扇形的区域，设置为180度
        menu.menuWholeAngle = CGFloat(M_PI)
        
        // 每个item弹出的延迟时间（0为所有item同时出去）
        menu.timeOffset = 0.036
        
        // 控制弹跳动画
        // 拉回来的弹跳最大距离
        menu.farRadius = 200
        // 弹出去的弹跳最大距离
        menu.nearRadius = 100
        
        // 最后弹跳动画结束后离中心点的距离
        menu.endRadius = 90
        
        menu.delegate = self
        self.view.addSubview(menu)
        
    }

    func awesomeMenu(menu: AwesomeMenu!, didSelectIndex idx: Int) {
        print(idx)
    }

}

