//
//  ViewController2.swift
//  StoryBoardSegueDemo
//
//  Created by Benjamin on 11/13/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var name: String?
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.setTitle(name, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
