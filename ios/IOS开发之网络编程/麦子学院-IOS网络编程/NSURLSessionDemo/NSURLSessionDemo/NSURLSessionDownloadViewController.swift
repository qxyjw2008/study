//
//  NSURLSessionDownloadViewController.swift
//  NSURLSessionDemo
//
//  Created by Benjamin on 11/21/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class NSURLSessionDownloadViewController: UIViewController,NSURLSessionDownloadDelegate {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var image: UIImageView!
    let imageStringURL = "http://p1.pichost.me/i/40/1639665.png"
    var task: NSURLSessionDownloadTask? = nil
    var partialData: NSData? = nil
    let fileManager = NSFileManager.defaultManager()
    var session: NSURLSession!
    var request: NSURLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.session = getSession()
        self.request = getRequest(imageStringURL)
        self.progressBar.progress = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //取得单个session
    func getSession() -> NSURLSession {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        return session
    }
    
    /**
     return a request by url of image
     
     - parameter imageStringURL: imageStringURL
     
     - returns: NSURLRequest
     */
    func getRequest(imageStringURL: String) -> NSURLRequest {
        let url = NSURL(string: imageStringURL)
        return NSURLRequest(URL: url!)
    }
    
    // Start Action
    @IBAction func start(sender: UIButton) {
        self.task = self.session.downloadTaskWithRequest(self.request)
        self.task?.resume()
    }
    
    // Pause Action
    @IBAction func pause(sender: UIButton) {
        print("pause download task")
        if self.task != nil {
            //取消下载任务，把下载好的数据存起来
            self.task?.cancelByProducingResumeData({ (resumeData: NSData?) -> Void in
                self.partialData = resumeData
                self.task = nil
            })
        }
    }
    
    // Resume Action
    @IBAction func resume(sender: UIButton) {
        print("resume download task")
        if self.task == nil {
            if self.partialData != nil {
                self.task = self.session.downloadTaskWithResumeData(self.partialData!)
            } else {
                self.task = self.session.downloadTaskWithRequest(self.request)
            }
        }
        self.task?.resume()
    }
    
    /**
     创建文件本地保存目录
     
     - parameter location: download location url
     
     - returns: NSURL
     */
    func createDirectoryForDownloadItemFromURL(location: NSURL!) -> NSURL{
        let documentURL: NSURL = (fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask))[0]
        return documentURL.URLByAppendingPathComponent(location.lastPathComponent!)
    }
    
    /**
     把文件拷贝到指定路径
     
     - parameter location:    original location
     - parameter destination: destinate location
     
     - returns: success is true, else false
     */
    func copyTempFileAtURL(fromLocation location: NSURL, toDestination destination: NSURL) -> Bool {
        do {
            try fileManager.copyItemAtURL(location, toURL: destination)
        } catch {
            print("file copy error")
            return false
        }
        return true
    }
    
    //MARK:下载完成调用
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        //下载完成后，文件是放在一个临时目录，需要开发者自己拷到防止该文件的目录
        let destination = createDirectoryForDownloadItemFromURL(location)
        print("download success for url: \(destination)")
        //如果文件copy成功
        if copyTempFileAtURL(fromLocation: location, toDestination: destination) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let image1 = UIImage(contentsOfFile: destination.path!)
                self.image.image = image1
                self.image.contentMode = .ScaleAspectFill
                self.image.hidden = false
            })
        } else {
            print("copy file error")
        }
        self.task = nil
    }
    
    //MARK:下载中调用
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let currentProgress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        print("下载了\(currentProgress)")
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.progressBar.progress = Float(currentProgress)
            self.progressBar.hidden = false
        }
    }
    
    //MARK:继续下载调用
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        print("resume...")
    }

}
