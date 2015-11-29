//
//  RegiTableViewController.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/27/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class RegiTableViewController: UITableViewController {
    @IBOutlet var loginTextField: [UITextBox]!
    @IBOutlet weak var labelUsername: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    @IBOutlet weak var labelEmail: UITextField!
    @IBOutlet weak var labelArea: UITextField!
    @IBOutlet weak var labelPassGuideQuestion: UITextField!
    @IBOutlet weak var labelPassAnswer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "新用户注册"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneRegi")
        //点击其他地方隐藏键盘
        let tapGesture = UITapGestureRecognizer(target: self, action: "hideKeyBoard")
        self.tableView.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
    }
    
    func hideKeyBoard() {
        self.view.endEditing(true)
        for textField in loginTextField {
            if !textField.text!.isEmpty {
                textField.placeholderLabel!.text = ""
                if textField.text?.characters.count <= 5 {
                    textField.highlightState = UITextBoxHighlightState.Wrong("用户名不能小于5位")
                }
            }
        }
    }
    
    func doneRegi() {
//        let alert = UIAlertController(title: "提示", message: "这是提示message", preferredStyle: .Alert)
//        let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
//        alert.addAction(action)
//        self.presentViewController(alert, animated: true, completion: nil)
        for textField in loginTextField {
            if textField.text!.isEmpty {
                self.errorNotice("必填项为空")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
