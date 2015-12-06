//
//  RegiTableViewController.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/27/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit
import AJWValidator

/*extension UITextField {
    var notEmpty: Bool {
        get {
            return self.text != ""
        }
    }
    
    func validate(RegEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluateWithObject(self.text)
    }
    
    func validateEmail() -> Bool {
        let regex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return self.validate(regex)
    }
    
    func validateUsername() -> Bool {
        return self.validate("^[A-Za-z0-9]{6,18}")
    }
    
    func validatePassword() -> Bool {
        return self.validate("^[A-Za-z0-9]{6,18}")
    }
}*/

class RegiTableViewController: UITableViewController {
    @IBOutlet var loginTextField: [UITextBox]!
    @IBOutlet weak var labelUsername: UITextBox!
    @IBOutlet weak var labelPassword: UITextBox!
    @IBOutlet weak var labelEmail: UITextBox!
    @IBOutlet weak var labelArea: UITextField!
    @IBOutlet weak var labelPassGuideQuestion: UITextField!
    @IBOutlet weak var labelPassAnswer: UITextField!
    var inputs: Inputs = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "新用户注册"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneRegi")
        self.navigationItem.rightBarButtonItem!.enabled = false
        //点击其他地方隐藏键盘
        let tapGesture = UITapGestureRecognizer(target: self, action: "hideKeyBoard")
        self.tableView.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        textFieldValid()
    }
    
    /**
     form 表单校验
     */
    func textFieldValid() {
        let barButtonItem = self.navigationItem.rightBarButtonItem
        let vali = AJWValidator(type: .String)
        vali.addValidationToEnsureRangeWithMinimum(6, maximum: 18, invalidMessage: "用户名长度6到18位(数字字母)")
        self.labelUsername.ajw_attachValidator(vali)
        vali.validatorStateChangedHandler = { (newState: AJWValidatorState) -> Void in
            switch newState {
            case .ValidationStateValid:
                self.labelUsername.highlightState = .Default
                self.inputs.unionInPlace(Inputs.user)
            case .ValidationStateInvalid:
                let errorMsg = vali.errorMessages.first as? String
                self.labelUsername.highlightState = .Wrong(errorMsg!)
                self.inputs.subtractInPlace(Inputs.user)
            default:
                break
            }
            barButtonItem!.enabled = self.inputs.isAllOk()
        }
        
        let passVali = AJWValidator(type: .String)
        passVali.addValidationToEnsureRangeWithMinimum(6, maximum: 18, invalidMessage: "密码长度6到18位(数字字母)")
        self.labelPassword.ajw_attachValidator(passVali)
        passVali.validatorStateChangedHandler = { (newState: AJWValidatorState) -> Void in
            switch newState {
            case .ValidationStateValid:
                self.labelPassword.highlightState = .Default
                self.inputs.unionInPlace(Inputs.pass)
            case .ValidationStateInvalid:
                let errorMsg = passVali.errorMessages.first as? String
                self.labelPassword.highlightState = .Wrong(errorMsg!)
                self.inputs.subtractInPlace(Inputs.pass)
            default:
                break
            }
            barButtonItem!.enabled = self.inputs.isAllOk()
        }
        
        let emailVali = AJWValidator(type: .String)
        emailVali.addValidationToEnsureValidEmailWithInvalidMessage("格式不正确")
        self.labelEmail.ajw_attachValidator(emailVali)
        emailVali.validatorStateChangedHandler = { (newState: AJWValidatorState) -> Void in
            switch newState {
            case .ValidationStateValid:
                self.labelEmail.highlightState = .Default
                self.inputs.unionInPlace(Inputs.mail)
            case .ValidationStateInvalid:
                let errorMsg = emailVali.errorMessages.first as? String
                self.labelEmail.highlightState = .Wrong(errorMsg!)
                self.inputs.subtractInPlace(Inputs.mail)
            default:
                break
            }
            barButtonItem!.enabled = self.inputs.isAllOk()
        }
    }
    
    /**
     第二种表单校验
     
     - parameter sender: <#sender description#>
     */
    @IBAction func textFieldChanged(sender: UITextBox) {
        
        /*sender.highlightState = UITextBoxHighlightState.Default
        if sender == labelUsername {
            if !sender.validateUsername() {
                sender.highlightState = UITextBoxHighlightState.Wrong("用户名长度6到18位(数字字母)")
            }
            
        } else if sender == labelPassword {
            if !sender.validatePassword() {
                sender.highlightState = UITextBoxHighlightState.Wrong("密码长度6到18位(数字字母)")
            }
            
        } else {
            if !sender.validateEmail() {
                sender.highlightState = UITextBoxHighlightState.Wrong("邮箱格式不正确")
            }
        }
        
        if labelUsername.notEmpty && labelPassword.notEmpty && labelEmail.notEmpty {
            if labelUsername.validateUsername() && labelPassword.validatePassword() && labelEmail.validateEmail() {
                self.navigationItem.rightBarButtonItem?.enabled = true
            } else {
                self.navigationItem.rightBarButtonItem?.enabled = false
            }
        } else {
            self.navigationItem.rightBarButtonItem?.enabled = false
        }*/
        
    }
    
    func hideKeyBoard() {
        self.view.endEditing(true)
    }
    
    func doneRegi() {
//        let alert = UIAlertController(title: "提示", message: "这是提示message", preferredStyle: .Alert)
//        let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
//        alert.addAction(action)
//        self.presentViewController(alert, animated: true, completion: nil)
        
        self.pleaseWait()
        
        let user = AVObject(className: "XYuser")
        user["username"] = self.labelUsername.text
        user["password"] = self.labelPassword.text
        user["email"] = self.labelEmail.text
        user["area"] = self.labelArea.text
        user["question"] = self.labelPassGuideQuestion.text
        user["answer"] = self.labelPassAnswer.text
        
        //判断用户名是否存在，如果存在，不让注册
        let query = AVQuery(className: "XYuser")
        query.whereKey("username", equalTo: self.labelUsername.text)
        query.getFirstObjectInBackgroundWithBlock { (object, e) -> Void in
            if object != nil {
                //存在用户名
                self.clearAllNotice()
                self.noticeError("用户名已存在", autoClear: true, autoClearTime: 2)
                self.labelUsername.becomeFirstResponder()
            } else {
                
                //保存用户到leancloud云中
                user.saveInBackgroundWithBlock { (success, e) -> Void in
                    if success {
                        self.clearAllNotice()
                        self.noticeSuccess("注册成功", autoClear: true, autoClearTime: 2)
                        self.navigationController?.popViewControllerAnimated(true)
                    } else {
                        print(e.description)
                        self.noticeError("注册失败", autoClear: true, autoClearTime: 2)
                        self.labelUsername.becomeFirstResponder()
                    }
                }
                
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
