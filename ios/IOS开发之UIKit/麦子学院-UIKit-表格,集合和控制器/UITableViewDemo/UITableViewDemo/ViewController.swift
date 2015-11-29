//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Benjamin on 11/8/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView1: UITableView!
    
    let cities = ["成都", "北京", "上海", "广州", "深圳"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.delegate = self
        tableView1.dataSource = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count * 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifierId = "benjamin"
        var cell: UITableViewCell
        if let _ = tableView.dequeueReusableCellWithIdentifier(identifierId) {
            cell = tableView.dequeueReusableCellWithIdentifier(identifierId)! as UITableViewCell
        } else {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifierId)
        }
//        cell.textLabel?.text = cities[indexPath.row]
//        cell.detailTextLabel?.text = "detail text..."
//        cell.accessoryType = .DetailButton
//        cell.imageView?.image = UIImage(named: "宝宝")
        
        let label1 = cell.viewWithTag(1) as! UILabel
        let textField1 = cell.viewWithTag(2) as! UITextField
        let switch1 = cell.viewWithTag(3) as! UISwitch
        
        var cell2: UITableViewCell
        cell2 = tableView.dequeueReusableCellWithIdentifier("benjamin2")!
        let label2 = cell2.viewWithTag(1) as! UILabel
        
        if indexPath.row % 2 == 0 {
            label1.text = cities[indexPath.row/2]
            textField1.placeholder = "detail text"
            switch1.on = false
            return cell
        } else {
            label2.text = "这是第二行"
            return cell2
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

