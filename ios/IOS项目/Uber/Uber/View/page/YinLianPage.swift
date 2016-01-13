//
//  YinLianPage.swift
//  Uber
//
//  Created by Benjamin on 1/5/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class YinLianPage: FxBasePage, NSURLConnectionDataDelegate {

    var responseData: NSMutableData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pay(sender: UIButton) {
        let url = NSURL(string: YLTnURL)
        startPay(url!)
    }
    
    func startPay(url: NSURL) {
        let urlRequest = NSURLRequest(URL: url)
        let connect = NSURLConnection(request: urlRequest, delegate: self)
        connect?.start()
    }

    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        let urlResponse = response as! NSHTTPURLResponse
        
        if urlResponse.statusCode != 200 {
            FxLog("error status code")
        } else {
            responseData = NSMutableData()
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData?.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let result = String(data: responseData!, encoding: NSUTF8StringEncoding)
        
        if result != nil {
            FxPayPlugin.startPayFx(result, fromSchema: "1", mode: "01", viewController: self)
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        FxLog(error.localizedFailureReason!)
    }
    
}
