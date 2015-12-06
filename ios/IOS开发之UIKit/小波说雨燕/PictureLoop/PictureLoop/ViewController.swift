//
//  ViewController.swift
//  PictureLoop
//
//  Created by Benjamin on 12/3/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var pageControl1: UIPageControl!
    @IBOutlet weak var scrollView1: UIScrollView!
    let images = ["s1", "s2", "s3"]
    var timer = NSTimer()
    //图片的宽
    var imageWidth:CGFloat!
    //图片的高
    var imageHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /**
     该方法计算了真实地scrollView地frame的大小
     详见：http://benjaminwhx.com/2015/12/03/IOS%E9%94%99%E8%AF%AF%E6%80%BB%E7%BB%93/
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageY: CGFloat = 0
        imageWidth = self.scrollView1.frame.size.width
        imageHeight = self.scrollView1.frame.size.height
        for i in 0..<images.count {
            let imageX = imageWidth * CGFloat(i)
            let imageView = UIImageView(image: UIImage(named: images[i]))
            imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight)
            self.scrollView1.addSubview(imageView)
        }
        let contentWidth = CGFloat(images.count) * imageWidth
        //设置scrollView的滚动范围
        self.scrollView1.contentSize = CGSizeMake(contentWidth, 0)
        
        //要分页
        self.scrollView1.pagingEnabled = true
        
        self.scrollView1.delegate = self
        
        //取消水平垂直滚动条
        scrollView1.showsHorizontalScrollIndicator = false
        scrollView1.showsVerticalScrollIndicator = false
        
        self.pageControl1.numberOfPages = images.count
        self.pageControl1.currentPage = 0
        addTimer()
    }
    
    //轮回下张图片
    func nextImage() {
        var currentPage = self.pageControl1.currentPage
        if currentPage == images.count-1 {
            currentPage = 0
        } else {
            currentPage++
        }
        let offsetX = imageWidth * CGFloat(currentPage)
        self.scrollView1.contentOffset = CGPointMake(offsetX, 0)
    }
    
    //图片滚动时调用,设置pageControl的当前page
    //(手动滑动 + 自动滚动 + 点击pageControl)都会触发
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetX = self.scrollView1.contentOffset.x
        self.pageControl1.currentPage = Int(offsetX / imageWidth)
    }
    
    @IBAction func pageValueChanged(sender: UIPageControl) {
        //用户点击点触发
        print("value changed, current page: \(sender.currentPage)")
        let offsetX = imageWidth * CGFloat(sender.currentPage)
        self.scrollView1.contentOffset = CGPointMake(offsetX, 0)
    }
    
    //定时
    func addTimer() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "nextImage", userInfo: nil, repeats: true)
        //添加到运行循环
        NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
    }
    
    //关闭定时器
    func removeTimer() {
        self.timer.invalidate()
    }
    
    //开始拖拽
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        removeTimer()
    }
    
    //停止拖拽
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    

}

