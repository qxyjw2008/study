//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Benjamin on 11/6/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var webView1: UIWebView!
    @IBAction func backButtonClick(sender: UIButton) {
        webView1.goBack()
    }
    @IBAction func forwardButtonClick(sender: UIButton) {
        webView1.goForward()
    }
    @IBAction func reloadButtonClick(sender: UIButton) {
        webView1.reload()
    }
    @IBAction func goButtonClick(sender: UIButton) {
        webView1.loadRequest(NSURLRequest(URL: NSURL(string: textField1.text!)!))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webView1.delegate = self
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("did start")
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        print("did finish")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

