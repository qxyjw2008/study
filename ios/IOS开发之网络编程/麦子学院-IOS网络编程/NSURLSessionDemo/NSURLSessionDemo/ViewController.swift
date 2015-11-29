//
//  ViewController.swift
//  NSURLSessionDemo
//
//  Created by Benjamin on 11/21/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLSessionDownloadDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /**
     使用NSURLSessionDataTask加载数据
     */
    func sessionLoadData() {
        //创建NSURL对象
        let url: NSURL! = NSURL(string: "http://m.weather.com.cn/data/101010100.html")
        //创建请求对象
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error != nil {
                print(error?.code)
                print(error?.description)
            } else {
                let jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(jsonString)
            }
        } as NSURLSessionTask
        
        dataTask.resume()
    }
    
    //使用NSURLSessionDownloadTask下载文件--简单下载，不需要知道下载进度
    func sessionSimpleDownload() {
        let url = NSURL(string: "http://www.iphonetrain.com/shop/data/ios/201404/source/2809080296130100.jpg")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        //下载任务
        let downloadTask = session.downloadTaskWithRequest(request) { (location: NSURL?, response: NSURLResponse?, e: NSError?) -> Void in
            //输出下载文件原来的存放目录
            print("location: \(location)")
            
            let locationPath = location?.path
            
            //拷贝到我们自己的目录
            let documents: String = NSHomeDirectory() + "/Documents/1.png"
            let fileManager = NSFileManager.defaultManager()
            do {
                try fileManager.moveItemAtPath(locationPath!, toPath: documents)
            } catch {
                print("move file error")
            }
        }
        downloadTask.resume()
    }

    //使用NSURLSessionUploadTask上传文件
    func sessionUpload() {
        //上传的位置
        let url = NSURL(string: "http://www.iphonetrain.com/shop/data/")
        //请求
        let request = NSURLRequest(URL: url!)
        //连接
        let session = NSURLSession.sharedSession()
        //上传数据流
        let documents:String = NSHomeDirectory() + "/Documents/1.png"
        let imgData = NSData(contentsOfFile: documents)
        
        let uploadTask = session.uploadTaskWithRequest(request, fromData: imgData) { (data: NSData?, _, e: NSError?) -> Void in
            print("upload ")
        }
        uploadTask.resume()
    }
    
    func currentSession() -> NSURLSession {
        var predicate: dispatch_once_t = 0
        var currentSession: NSURLSession? = nil
        dispatch_once(&predicate) { () -> Void in
            currentSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        }
        return currentSession!
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        
    }
}

