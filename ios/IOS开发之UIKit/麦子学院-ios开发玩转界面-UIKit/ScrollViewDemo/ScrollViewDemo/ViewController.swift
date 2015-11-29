//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Benjamin on 11/6/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl1: UIPageControl!
    @IBOutlet weak var scrollView1: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //iphone5s run
        scrollView1.contentSize = CGSize(width: 327*4 , height: 568)
//        scrollView1.contentOffset = CGPoint(x: 10, y: 10)
//        scrollView1.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        scrollView1.indicatorStyle = .White
        scrollView1.backgroundColor = UIColor.redColor()
        scrollView1.delegate = self
        
        let aView = UIView(frame: CGRect(x: 0*327, y: 0, width: 327, height: 568))
        aView.backgroundColor = UIColor.greenColor()
        scrollView1.addSubview(aView)
        let bView = UIView(frame: CGRect(x: 1*327, y: 0, width: 327, height: 568))
        bView.backgroundColor = UIColor.yellowColor()
        scrollView1.addSubview(bView)
        let cView = UIView(frame: CGRect(x: 2*327, y: 0, width: 327, height: 568))
        cView.backgroundColor = UIColor.blueColor()
        scrollView1.addSubview(cView)
        
//        pageControl1.addTarget(self, action: "pageChange", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func pageControlValueChanged(sender: UIPageControl) {
        let page = sender.currentPage
        if page == 3 {
            scrollView1.scrollRectToVisible(CGRect(x: 0*327, y: 0, width: 327, height: 568), animated: true)
        } else {
            scrollView1.scrollRectToVisible(CGRect(x: page*327, y: 0, width: 327, height: 568), animated: true)
        }
    }
    func pageChange() {
        let page = pageControl1.currentPage
        if page == 3 {
            scrollView1.scrollRectToVisible(CGRect(x: 0*327, y: 0, width: 327, height: 568), animated: true)
        } else {
            scrollView1.scrollRectToVisible(CGRect(x: page*327, y: 0, width: 327, height: 568), animated: true)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/325
        pageControl1.currentPage = Int(page)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

