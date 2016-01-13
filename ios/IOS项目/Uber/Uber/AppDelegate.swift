//
//  AppDelegate.swift
//  Uber
//
//  Created by Benjamin on 12/31/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var guidePage: GuidePage?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FxLog("start")
        print(ServerAddress())
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        showGuidePage()
        return true
    }
    
    func showGuidePage() {
        let page = GuidePage()
        self.window?.rootViewController = page
        self.window?.makeKeyAndVisible()
    }

    func showHomePage() {
        let homePage = HomePage()
        let naviController = UINavigationController(rootViewController: homePage)
        self.window?.rootViewController = naviController
        self.window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

