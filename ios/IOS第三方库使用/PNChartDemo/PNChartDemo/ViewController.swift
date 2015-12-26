//
//  ViewController.swift
//  PNChartDemo
//
//  Created by Benjamin on 12/18/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var charts = ["Line Chart", "Bar Chart", "Circle Chart", "Pie Chart"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = charts[indexPath.row]
        cell?.accessoryType = .DisclosureIndicator
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let chart = segue.destinationViewController as! ChartViewController
        chart.chartType = sender as! String
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let chartViewController = ChartViewController()
//        chartViewController.chartType = charts[indexPath.row]
//        self.navigationController?.pushViewController(chartViewController, animated: true)
        self.performSegueWithIdentifier("toChart", sender: charts[indexPath.row])
    }
}

