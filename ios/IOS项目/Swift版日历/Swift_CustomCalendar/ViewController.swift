//
//  ViewController.swift
//  Swift_CustomCalendar
//
//  Created by hcy on 15/12/8.
//  Copyright © 2015年 hcy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var value: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func show(sender: AnyObject) {
        let vc = CalendarViewController(IsSelecetdMultiple: true) { (value) -> Void in
            print(value)
            self.value.text=value.description
        }
        
        self.presentViewController(vc, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

