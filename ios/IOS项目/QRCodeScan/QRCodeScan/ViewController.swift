//
//  ViewController.swift
//  QRCodeScan
//
//  Created by Benjamin on 12/14/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit
//导入音频视频基础库
import AVFoundation

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var labelQrCode: UILabel!
    @IBOutlet weak var buttonScan: UIButton!
    
    //视频捕捉动画
    var session: AVCaptureSession?
    
    //视频画面预览层
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    //自动锁定小方框
    var autolockView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonScan.hidden = true
        session = AVCaptureSession()
        
        //指定设备是摄像头
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        //输入
        do {
            let input = try AVCaptureDeviceInput(device: device)
            session?.addInput(input)
        } catch {
            print("无法使用摄像头")
            return
        }
        
        //输出
        let output = AVCaptureMetadataOutput()
        session?.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        //二维码、商品条形码，人脸
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeFace]
        
        //视图预览层
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        //启动会话
        session?.startRunning()
        
        //把标签显示
        self.view.bringSubviewToFront(self.labelQrCode)
        
        autolockView = UIView()
        autolockView?.layer.borderColor = UIColor.greenColor().CGColor
        autolockView?.layer.borderWidth = 2
        view.addSubview(autolockView!)
        view.bringSubviewToFront(autolockView!)
    }
    
    //停止扫描
    func stopScan(){
        session?.stopRunning()
        buttonScan.hidden = false
        self.view.bringSubviewToFront(buttonScan)
    }

    //一旦视频捕捉完成有输出
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        //判断元数据是否有输出
        if metadataObjects == nil || metadataObjects.count == 0 {
            autolockView?.frame = CGRectZero
            labelQrCode.text = "雷达正在扫描中..."
            return
        }
        
        //如果是人脸对象
        if let obj = metadataObjects.first as? AVMetadataFaceObject {
            if obj.type == AVMetadataObjectTypeFace {
                let faceObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(obj) as? AVMetadataFaceObject
                autolockView?.frame = (faceObject?.bounds)!
                
                labelQrCode.text = "发现可爱小球球"
            }
        }
        
        //如果是条形码
        if let obj = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(obj) as? AVMetadataMachineReadableCodeObject
            autolockView?.frame = (barCodeObject?.bounds)!
            
            switch obj.type {
            case AVMetadataObjectTypeQRCode:
                if let decodeStr = obj.stringValue {
                    stopScan()
                    labelQrCode.text = "二维码: " + decodeStr
                    
                    launchApp(decodeStr)
                }
            case AVMetadataObjectTypeEAN13Code:
                if let decodeStr = obj.stringValue {
                    stopScan()
                    labelQrCode.text = "商品码: " + decodeStr
                    
                    showGoodsName(decodeStr)
                }
            default:
                return
            }
        }
    }

    //重新扫描
    @IBAction func reScan(sender: UIButton) {
        buttonScan.hidden = true
        session?.startRunning()
    }
    
    //打开一个url对应的程序
    func launchApp(decodeStr: String) {
        let alert = UIAlertController(title: "二维码", message: "将要打开\(decodeStr)", preferredStyle: .ActionSheet)
        let okAction = UIAlertAction(title: "打开", style: .Destructive) { (_) -> Void in
            //如果可以打开，调用系统打开
            if let url = NSURL(string: decodeStr) {
                if UIApplication.sharedApplication().canOpenURL(url) {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
        
        alert.addAction(okAction)
        
        //ipad要加上下面这句
        alert.popoverPresentationController?.sourceRect = labelQrCode.frame
        alert.popoverPresentationController?.sourceView = view
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //http://api.juheapi.com/jhbar/bar?appkey= 7790e4b66b08b0cb18cca08345acde96&pkg=com.scanCode&cityid=1&barcode
    
    func showGoodsName(decodeStr: String) {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let baseUrl = "http://api.juheapi.com/jhbar/bar?appkey= 7790e4b66b08b0cb18cca08345acde96&pkg=com.scanCode&cityid=1&barcode"
        
        let request = NSURLRequest(URL: NSURL(string: baseUrl + decodeStr)!)
        
        let task = session.dataTaskWithRequest(request) { (data, _, e) -> Void in
            if e == nil {
                do {
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSDictionary {
                        print(json)
                        
                        if let summary = json["result"]?["summary"] as? NSDictionary {
                            let name = summary.valueForKey("name") as? String
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.labelQrCode.text = self.labelQrCode.text! + " " + name!
                            })
                            
                        }
                    }
                }catch {
                    print("json解析错误")
                }
            }
        }
        
        task.resume()
    }
}

