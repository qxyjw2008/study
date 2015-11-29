//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/24/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {
    
    let conversationVC = ConversationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.connectServer({ () -> Void in
            self.setDisplayConversationTypes([
                    RCConversationType.ConversationType_PRIVATE.rawValue,
                    RCConversationType.ConversationType_SYSTEM.rawValue,
                    RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                    RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                    RCConversationType.ConversationType_GROUP.rawValue,
                    RCConversationType.ConversationType_DISCUSSION.rawValue,
                    RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                    RCConversationType.ConversationType_CHATROOM.rawValue,
                    RCConversationType.ConversationType_APPSERVICE.rawValue
                ])
            self.refreshConversationTableViewIfNeeded()
        })
    }
    
    //回到视图显示tabbar栏
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    //将要segue时影藏tabbar栏
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController?.tabBar.hidden = true
        
        let cv = segue.destinationViewController as? RCConversationViewController
        cv?.targetId = conversationVC.targetId
        cv?.userName = conversationVC.userName
        cv?.conversationType = conversationVC.conversationType
        cv?.title = conversationVC.title
        
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
//        conversationVC.targetId = model.targetId
//        conversationVC.userName = model.conversationTitle
//        conversationVC.conversationType = model.conversationType
//        conversationVC.title = "与" + model.conversationTitle + "的会话中"
//        self.navigationController?.pushViewController(conversationVC, animated: true)
        
        conversationVC.targetId = model.targetId
        conversationVC.userName = model.conversationTitle
        conversationVC.conversationType = model.conversationType
        conversationVC.title = "与" + model.conversationTitle + "的会话中"
        self.performSegueWithIdentifier("pushConversationList", sender: self)
        self.tabBarController?.tabBar.hidden = true
        //返回时取消cell选中状态
        self.conversationListTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //点击右上角的Add弹出Menu
    @IBAction func alertMenu(sender: UIBarButtonItem) {
        // KxMenu特效
        /*var frame = sender.valueForKey("view")?.frame
        frame?.origin.y += 30
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            KxMenuItem("发起群聊", image: UIImage(named: "conversation"), target: self, action: "clickItem1"),
            KxMenuItem("好友列表", image: UIImage(named: "tabbar_contacts"), target: self, action: "clickItem2"),
            KxMenuItem("扫一扫", image: UIImage(named: "MoreQRCode"), target: self, action: "clickItem3"),
            KxMenuItem("收钱", image: UIImage(named: "MoreShopping"), target: self, action: "clickItem4")
            ])*/
        
        //PopMenu特效
        let items = [
            MenuItem(title: "Flickr", iconName: "post_type_bubble_flickr", glowColor: UIColor.grayColor(), index: 0),
            MenuItem(title: "Googleplus", iconName: "post_type_bubble_googleplus", glowColor: UIColor(red: 0.000, green: 0.840, blue: 0.000, alpha: 1.000), index: 1),
            MenuItem(title: "Instagram", iconName: "post_type_bubble_instagram", glowColor: UIColor(red: 0.687, green: 0.000, blue: 0.000, alpha: 1.000), index: 2),
            MenuItem(title: "Twitter", iconName: "post_type_bubble_twitter", glowColor: UIColor(red: 0.687, green: 0.000, blue: 0.000, alpha: 1.000), index: 3),
            MenuItem(title: "Youtube", iconName: "post_type_bubble_youtube", glowColor: UIColor(red: 0.687, green: 0.000, blue: 0.000, alpha: 1.000), index: 4),
            MenuItem(title: "Facebook", iconName: "post_type_bubble_facebook", glowColor: UIColor(red: 0.687, green: 0.000, blue: 0.000, alpha: 1.000), index: 5)
        ]
        let popMenu = PopMenu(frame: self.view.bounds, items: items)
        popMenu.menuAnimationType = .NetEase
        popMenu.perRowItemCount = 3
        if popMenu.isShowed {
            return
        }
        //选择某项触发的事件
        popMenu.didSelectedItemCompletion = { (selectedItem: MenuItem!) -> Void in
            print(selectedItem.index)
        }
        popMenu.showMenuAtView(self.view)
    }
    
    func clickItem1() {
        print("这是发起群聊")
    }
    
    func clickItem2() {
        print("这是好友列表")
    }
    
    func clickItem3() {
        print("这是扫一扫")
    }
    
    func clickItem4() {
        print("这是收钱")
    }
}
