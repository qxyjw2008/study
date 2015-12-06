//
//  ViewController.swift
//  webViewDemo
//
//  Created by Benjamin on 12/3/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIWebViewDelegate {
    @IBOutlet weak var webView1: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var textInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textInput.delegate = self
        webView1.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("return")
        textInput.resignFirstResponder()
        loadRequest(textInput.text!, webview: webView1)
        return true
    }
    
    func loadRequest(url: String, webview: UIWebView) {
        let url = NSURL(string: ("http://" + url))!
        let request = NSURLRequest(URL: url)
        webview.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        //自定义齿轮出现
        indicator.startAnimating()
        //左上角的齿轮出现
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        indicator.stopAnimating()
        //自定义齿轮消失
        //左上角的齿轮消失
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

