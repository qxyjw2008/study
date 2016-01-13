//
//  GuidePage.swift
//  Uber
//
//  Created by Benjamin on 1/2/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: FxBasePage {

    @IBOutlet var imageView: UIImageView?
    @IBOutlet var backView: UIView?
    
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    var location: FxLocation!
    let bundle = NSBundle.mainBundle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVideo()
        showBackGround()
    }

    /**
     播放启动页面的动画
     */
    private func showBackGround() {
//        var images: [UIImage] = []
//        for i in 0...67 {
//            let imageName = "logo-" + String(format: "%03d", i) + ".png"
//            let imagePath = bundle.pathForResource(imageName, ofType: nil)!
//            images.append(UIImage(contentsOfFile: imagePath)!)
//        }
//        
//        imageView?.animationImages = images
//        imageView?.animationDuration = 5.0
//        imageView?.animationRepeatCount = 1
//        imageView?.startAnimating()
        
        // 动画播完后播放视频
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.backView?.alpha = 1.0
            self.player?.play()
            }) { (finished) -> Void in
                print("finish animation")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     初始化视频播放
     */
    private func initVideo() {
        let mp4Path = bundle.pathForResource("welcome_video", ofType: "mp4")!
        let url = NSURL.fileURLWithPath(mp4Path)
        self.playerItem = AVPlayerItem(URL: url)
        self.player = AVPlayer(playerItem: self.playerItem)
        let playerLayer = AVPlayerLayer(player: self.player)
        playerLayer.frame = self.backView!.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        //把视频涂层放在backView的最上面
        self.backView?.layer.insertSublayer(playerLayer, atIndex: 0)
        self.backView?.alpha = 0.0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFinishVideo:", name: AVPlayerItemDidPlayToEndTimeNotification, object: self.playerItem)
    }
    
    /**
     视频播放完成后循环播放，不能定义成私有方法
     - parameter sender: playerItem
     */
    func didFinishVideo(sender: NSNotification) {
        let item = sender.object as! AVPlayerItem
        item.seekToTime(kCMTimeZero)
        self.player.play()
    }

    @IBAction func login() {
        location = FxLocation()
        location.startLocation()
        SVProgressHUD.show()
    }
    
    @IBAction func register() {
        let page = CreateAccountPage()
        let naviController = UINavigationController(rootViewController: page)
        self.presentViewController(naviController, animated: false, completion: nil)
    }
}
