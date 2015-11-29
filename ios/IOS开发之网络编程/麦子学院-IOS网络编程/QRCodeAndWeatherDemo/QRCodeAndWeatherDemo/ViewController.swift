//
//  ViewController.swift
//  QRCodeAndWeatherDemo
//
//  Created by Benjamin on 11/20/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLSessionDownloadDelegate {

    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelWeather: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var qrCodeImage: UIImageView!
    
    let qrCodeData = "benjamin"
    
    var qrCodeURL: String {
        get {
            return "http://api.k780.com:88/?app=qr.get&data=\(qrCodeData)&level=L&size=6"
        }
    }
    
    let weatherURL = "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"

    func getSession() -> NSURLSession{
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        return session
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQRCode()
        loadWeather()
    }
    
    func loadQRCode() {
        let session = getSession()
        let url = NSURL(string: qrCodeURL)!
        let request = NSURLRequest(URL: url)
        //这个url是临时目录，~/Document/tmp
        let task = session.downloadTaskWithRequest(request) { (url, _, e) -> Void in
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
                guard e == nil else {
                    print("request error: \(e)")
                    return
                }
                let data = NSData(contentsOfURL: url!)!
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    print("show the qrcode in image.")
                    self.qrCodeImage.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }

    func loadWeather() {
        let session = getSession()
        let url = NSURL(string: weatherURL)!
        
        let task = session.dataTaskWithURL(url) { (data, _, e) -> Void in
            var city: String!
            var temp: String!
            var weather: String!
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
                guard e == nil else {
                    print("load weather error: \(e)")
                    return
                }
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                    if String(json["success"]!) == "1" {
                        let results = json["result"]! as! NSArray
                        let todayWeatherJson = results[0] as! NSDictionary
                        city = todayWeatherJson["citynm"] as! String
                        temp = todayWeatherJson["temperature"] as! String
                        weather = todayWeatherJson["weather"] as! String
                    }
                } catch {
                    print("weather error")
                }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.labelCity.text = city
                    self.labelWeather.text = weather
                    self.labelTemp.text = temp
                    
                })
            }
            
        }
        task.resume()
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    }
}

