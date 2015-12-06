//
//  VocationList.swift
//  HolidayList
//
//  Created by Benjamin on 12/2/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class VocationList: UITableViewController {

    var vocationList = [Vocation]()
    
    /**
     初始化数据
     */
    func initData() {
        let places = ["柳州", "南京", "北海", "阳朔", "泰州"]
        for p in 0..<places.count {
            let vocation = Vocation()
            vocation.place = places[p]
            vocationList.append(vocation)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
        if self.editing {
            print("正在编辑")
            self.editButtonItem().title = "完成"
        } else {
            print("点击完成")
            self.editButtonItem().title = "编辑"
        }
        print("当前的剩余数量: \(vocationList)")
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            vocationList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        }
    }
    
    // 点击编辑后，默认的样式 可以选择删除或者添加
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocationList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = vocationList[indexPath.row].place
        if vocationList[indexPath.row].isVisit {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vocation = vocationList[indexPath.row]
        vocation.isVisit = !vocation.isVisit
        //取消单元格的选中状态
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        //重新加载数据
        tableView.reloadData()
    }
    

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
    
    @IBAction func unwindToVocationList(segue: UIStoryboardSegue) {
        let addVocationController = segue.sourceViewController as! AddVocationViewController
        let v1 = addVocationController.vocation
        if v1.place != "" {
            vocationList.append(v1)
            print("增加之后的数据: \(vocationList)")
            self.tableView.reloadData()
        }
    }

}
