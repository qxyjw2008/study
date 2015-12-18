//
//  ViewController.swift
//  MJRefreshDemo
//
//  Created by Benjamin on 12/15/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,
    HZPhotoBrowserDelegate, XActionSheetDelegate, ImagePickerDelegate, SwipeableCellDelegate,
    SwipeableCellDataSource, EAIntroDelegate{

    var tableView: UITableView!
    var objectArray = [String]()
    var i = 0
    var head: XHPathCover!
    var isEdting = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(self.tableView)
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView.registerClass(SwipeableCell.classForCoder(), forCellReuseIdentifier: "cell")
        //把tableview下面没有数据的横线去掉
        self.tableView.tableFooterView = UIView()
        
        for i; i < 10; i++ {
            self.objectArray.append("\(i)")
        }
        
        //添加上拉刷新和下拉加载
//        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "headRefresh")
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "footRefresh")
        
        //使用xhpathCover
        let mainBounds = UIScreen.mainScreen().bounds
        head = XHPathCover(frame: CGRectMake(0, 0, mainBounds.width, 200))
        head.setBackgroundImage(UIImage(named: "2"))
        head.setAvatarImage(UIImage(named: "avatar"))
        head.isZoomingEffect = true
        head.avatarButton.layer.cornerRadius = 33
        head.avatarButton.addTarget(self, action: "popActionSheet", forControlEvents: .TouchUpInside)
        head.avatarButton.clipsToBounds = true
        head.setInfo(NSDictionary(objects: ["Caroline", "1991-05-13"], forKeys: [XHUserNameKey, XHBirthdayKey]) as [NSObject: AnyObject])
        head.handleRefreshEvent = {
            self.headRefresh()
        }
        
        //使用自定义LineView
        let lineView = LineView(frame: CGRectMake(0, 200, mainBounds.width, 60))
        
        //把XHPathCover和LineView合并为headView
        let headView = UIView(frame: CGRectMake(0, 0, mainBounds.width, 200 + 60))
        headView.addSubview(head)
        headView.addSubview(lineView)
        
        self.tableView.tableHeaderView = headView
        
        // 欢迎界面
        introView()
        
    }
    
    // mark - intro pages
    func introView() {
        self.navigationController?.navigationBar.hidden = true
        let page1 = EAIntroPage()
        page1.bgImage = UIImage(named: "image1")
        page1.title = "不乱于心"
        page1.desc = "生如夏花之绚烂"
        page1.titleFont = UIFont.systemFontOfSize(20)
        page1.titlePositionY = 400
        
        let page2 = EAIntroPage()
        page2.bgImage = UIImage(named: "image2")
        page2.title = "不困于情"
        page2.desc = "死于秋叶之静美"
        page2.titleFont = UIFont.systemFontOfSize(20)
        page2.titlePositionY = 400
        
        let page3 = EAIntroPage()
        page3.bgImage = UIImage(named: "image3")
        page3.title = "Caroline"
        page3.desc = "如此安好"
        page3.titleFont = UIFont.systemFontOfSize(20)
        page3.titlePositionY = 400
        
        let intro = EAIntroView(frame: self.view.bounds, andPages: [page1, page2, page3])
        intro.delegate = self
        intro.showInView(self.view, animateDuration: 0.0)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row > objectArray.count {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SwipeableCell
        
        //这段的目的是在上拉下拉的时候解决多视图覆盖的问题
        for view in cell.containerView.subviews {
            view.removeFromSuperview()
        }
        
        let image = UIImageView(frame: CGRectMake(10, 10, 60, 60))
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        image.sd_setImageWithURL(NSURL(string: "http://benjaminwhx.com/images/avatar.jpg"), placeholderImage: UIImage(named: "3"))
        cell.containerView.addSubview(image)
        
        let label = UILabel(frame: CGRectMake(80, 30, 100, 20))
        label.text = "这是第: \(objectArray[indexPath.row])行"
        cell.containerView.addSubview(label)
        
        // SwipeableCell
        cell.delegate = self
        cell.dataSource = self
        cell.setNeedsUpdateConstraints()
        if self.isEdting.containsObject(indexPath) {
            cell.openCell(false)
        } else {
            cell.closeCell(false)
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func headRefresh() {
        ProgressHUD.show("亲爱的，别急嘛~~~", interaction: true)
        self.delayLoad(2) { () -> () in
            self.objectArray.removeAll(keepCapacity: false)
            self.i = 0
            for self.i; self.i < 10; self.i++ {
                self.objectArray.append("\(self.i)")
            }
//            self.tableView.mj_header.endRefreshing()
            self.tableView.reloadData()
            self.head.stopRefresh()
            ProgressHUD.showSuccess("人家准备好了!")
        }
    }
    
    func footRefresh() {
        ProgressHUD.show("还有更多内容", interaction: true)
        self.delayLoad(2) { () -> () in
            let j = self.i + 10
            for self.i; self.i < j; self.i++ {
                self.objectArray.append("\(self.i)")
            }
            self.tableView.mj_footer.endRefreshing()
            self.tableView.reloadData()
            ProgressHUD.showSuccess("好了啦~~")
        }
    }
    
    func delayLoad(time: Double, closure: () -> () ) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    // mark - click avatar pop the ActionSheet
    func popActionSheet() {
        let sheet = XActionSheet()
        sheet.addCancelButtonWithTitle("取消")
        sheet.addButtonwithTitle("拍照")
        sheet.addButtonwithTitle("相册")
        sheet.addButtonwithTitle("查看高清大图")
        sheet.delegate = self
        sheet.show()
    }
    
    // mark - when click the ActionSheet the 3
    func getPhotoBrowser() {
        let browserVc = HZPhotoBrowser()
        browserVc.sourceImagesContainerView = head.avatarButton
        browserVc.imageCount = 1
        browserVc.currentImageIndex = 0
        browserVc.delegate = self
        browserVc.show()
    }
    
    // mark - EAIntroView delegate
    func introDidFinish(introView: EAIntroView!) {
        self.navigationController?.navigationBar.hidden = false
    }
    
    // mark - Swipeable delegate and datasource
    func swipeableCellDidOpen(cell: SwipeableCell!) {
        let indexPath = tableView.indexPathForCell(cell) as NSIndexPath!
        self.isEdting.addObject(indexPath)
    }
    func swipeableCellDidClose(cell: SwipeableCell!) {
        let indexPath = tableView.indexPathForCell(cell) as NSIndexPath!
        self.isEdting.removeObject(indexPath)
    }
    func swipeableCell(cell: SwipeableCell!, didSelectButtonAtIndex index: Int) {
        // 删除按钮
        if index == 0 {
            let indexPath = tableView.indexPathForCell(cell) as NSIndexPath!
            objectArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            self.isEdting.removeObject(indexPath)
        }
    }
    func numberOfButtonsInSwipeableCell(cell: SwipeableCell!) -> Int {
        return 3
    }
    func swipeableCell(cell: SwipeableCell!, buttonForIndex index: Int) -> UIButton! {
        let btn = UIButton(frame: CGRectMake(0, 0, 60, 60))
        if index == 0 {
            btn.backgroundColor = UIColor.redColor()
            btn.setTitle("删除", forState: .Normal)
        } else if index == 1 {
            btn.backgroundColor = UIColor.blueColor()
        } else if index == 2 {
            btn.backgroundColor = UIColor.brownColor()
        }
        return btn
    }
    
    // mark - ActionSheet delegate
    func buttonClick(index: Int) {
        print(index)
        if index == 1 {
            performImagePicker()
        }
        if index == 2 {
            getPhotoBrowser()
        }
    }
    
    private func performImagePicker() {
        let imagePicker = ImagePickerController()
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // mark - ImagePicker delegate
    func doneButtonDidPress(images: [UIImage]) {
        if images.count == 1 {
            let im = images.first! as UIImage
            self.head.avatarButton.setImage(im, forState: .Normal)
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            ProgressHUD.showError("只能选择一张图片作为头像")
        }
    }
    func wrapperDidPress(images: [UIImage]) {
        
    }
    func cancelButtonDidPress() {
        
    }
    
    // mark - photoBrowser delegate
    func photoBrowser(browser: HZPhotoBrowser!, placeholderImageForIndex index: Int) -> UIImage! {
        return head.avatarButton.currentImage
    }
    func photoBrowser(browser: HZPhotoBrowser!, highQualityImageURLForIndex index: Int) -> NSURL! {
        return NSURL(string: "http://carolinehjq.com/images/avatar.png")
    }
    
    // mark - scroll delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.head.scrollViewDidScroll(scrollView)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.head.scrollViewDidEndDecelerating(scrollView)
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.head.scrollViewDidEndDragging(scrollView, willDecelerate: decelerate)
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.head.scrollViewWillBeginDragging(scrollView)
    }

}

