//
//  ViewController.swift
//  UITableViewDemo2
//
//  Created by Benjamin on 11/8/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView1: UITableView!
    var provinces = ["四川", "山东", "江苏"]
    var cities = ["四川":["成都", "绵阳", "广元"], "山东": ["青岛", "威海", "济南"], "江苏": ["泰州", "南京", "宿迁", "徐州", "扬州", "盐城"]]
    var flagForEdit = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCityTable()
    }
    
    //删除按钮点击事件
    @IBAction func editButtonClick(sender: UIBarButtonItem) {
        flagForEdit = 1
        tableView1.setEditing(!tableView1.editing, animated: true)
        if tableView1.editing {
            sender.title = "Done"
        } else {
            sender.title = "Edit"
        }
    }
    
    //添加按钮点击事件
    @IBAction func addButtonClick(sender: UIBarButtonItem) {
        flagForEdit = 2
        tableView1.setEditing(!tableView1.editing, animated: true)
        if tableView1.editing {
            sender.title = "Done"
        } else {
            sender.title = "Add"
        }
    }
    
    //编辑哪些行，true为全部可以编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //编辑样式 delete insert
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return flagForEdit == 1 ? .Delete : .Insert
    }
    
    //删除的title名称
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "确认删除吗?"
    }
    
    //提交
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //删除 1，数组 2，列表
        let province = provinces[indexPath.section]
        if flagForEdit == 1 {
            cities[province]?.removeAtIndex(indexPath.row)
            tableView1.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            //如果section里的city为空，删除province
            if cities[province]!.isEmpty {
                cities.removeValueForKey(province)
                provinces.removeAtIndex(indexPath.section)
                tableView1.deleteSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Fade)
            }
        } else {
            let cityName = cities[province]![indexPath.row]
            cities[province]?.insert(cityName, atIndex: indexPath.row+1)
            let newIndexPath = NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)
            tableView1.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //移动cell主要方法
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let province = provinces[sourceIndexPath.section]
        print("移动前: \(province)省下的市有: \(cities[province]!)")
        let originalCity = cities[province]![sourceIndexPath.row]
        cities[province]!.removeAtIndex(sourceIndexPath.row)
        //判断是否跨section移动
        if sourceIndexPath.section == destinationIndexPath.section {
            cities[province]!.insert(originalCity, atIndex: destinationIndexPath.row)
        } else {
            let newProvince = provinces[destinationIndexPath.section]
            cities[newProvince]?.insert(originalCity, atIndex: destinationIndexPath.row)
        }
        print("移动后: \(province)省下的市有: \(cities[province]!)")
        print("sourceIndexPath row is: \(sourceIndexPath.row) and section is: \(sourceIndexPath.section)")
        print("destinationIndexPath row is: \(destinationIndexPath.row) and section is: \(destinationIndexPath.section)")
        //移动tableView
        tableView1.reloadData()
//        tableView1.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
    }
    
    func loadCityTable() {
        tableView1.delegate = self
        tableView1.dataSource = self
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "benjamin"
        var tableViewCell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if tableViewCell == nil {
            tableViewCell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        tableViewCell?.textLabel?.text = cities[provinces[indexPath.section]]![indexPath.row]
        tableViewCell?.accessoryType = .DisclosureIndicator
        return tableViewCell!
    }
    
    //select
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("选择了第\(indexPath.row)行")
    }
    //返回每个section的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities[provinces[section]]!.count
    }
    
    //返回section的个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return provinces.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return provinces[section]
    }
    
    //索引
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return provinces
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

