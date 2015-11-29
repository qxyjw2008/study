//
//  AppDelegate.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/23/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?

    let myAppKey = "mgb7ka1nb9n4g"
    let myToken = "mTYSDsXYFOaKotlxSz9eT59vTweECl5gSuXPklHDZj+9E0G24rcYPdlIS1BhKh2qRvRnnl265YPn5vacajXoQUdXFDGGTvfZ"
    
    /**
     显示用户的昵称 头像
     
     - parameter userId:     <#userId description#>
     - parameter completion: <#completion description#>
     */
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        
        switch userId {
        case "benjamin":
            userInfo.name = "benjamin"
            userInfo.portraitUri = "http://h.hiphotos.baidu.com/image/pic/item/4ec2d5628535e5dd2820232370c6a7efce1b623a.jpg"
        case "benjaminwhx":
            userInfo.name = "吴海旭"
            userInfo.portraitUri = "http://benjaminwhx.com/images/avatar.jpg"
        case "Caroline":
            userInfo.name = "傻宝宝"
            userInfo.portraitUri = "http://carolinehjq.com/images/avatar.jpg"
        default:
            print("查无此人")
        }
        return completion(userInfo)
    }
    
    func connectServer(success: () -> Void) {
        //查询保存的token
        //        let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        //初始化appkey
        RCIM.sharedRCIM().initWithAppKey(myAppKey)
        
        RCIM.sharedRCIM().userInfoDataSource = self
        //连接服务器
        RCIM.sharedRCIM().connectWithToken(myToken, success: { (_) -> Void in
            print("connect success")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                success()
            })
            }, error: { (status: RCConnectErrorCode) -> Void in
                print("error status: \(status)")
            }) { () -> Void in
                print("Token失效")
        }
    }
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

