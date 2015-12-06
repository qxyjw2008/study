//
//  ViewController.swift
//  ToolBarViewDemo
//
//  Created by Benjamin on 12/3/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createToolBars()
    }
    
    func createToolBars() {
        let items = [trashBarButton, spaceBarButton, replyBarButton]
        toolbar.setItems(items, animated: true)
    }
    
    var trashBarButton: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: "clickTrash")
    }
    
    var replyBarButton: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .Reply, target: self, action: "clickReply")
    }
    
    var spaceBarButton: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
    }
    
    func clickTrash() {
        print("点击了Trash")
    }
    
    func clickReply() {
        print("点击了Reply")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

