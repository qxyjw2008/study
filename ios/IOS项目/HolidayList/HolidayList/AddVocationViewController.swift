//
//  AddVocationViewController.swift
//  HolidayList
//
//  Created by Benjamin on 12/2/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class AddVocationViewController: UIViewController {

    @IBOutlet weak var labelVocation: UITextField!
    var vocation = Vocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender as? NSObject == self.navigationItem.rightBarButtonItem {
            if (!labelVocation.text!.isEmpty) {
                vocation.place = self.labelVocation.text!
            }
        }
    }

    
}
