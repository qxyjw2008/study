//
//  ChartViewController.swift
//  PNChartDemo
//
//  Created by Benjamin on 12/18/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

let mainScreen = UIScreen.mainScreen().bounds

class ChartViewController: UIViewController,PNChartDelegate {

    var chartType: String!
    var lineChart: PNLineChart!
    var legend: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chartType == "Line Chart" {
            self.LineChart()
        } else if chartType == "Bar Chart" {
            self.BarChart()
        } else if chartType == "Circle Chart" {
            self.CircleChart()
        } else if chartType == "Pie Chart" {
            self.PieChart()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func LineChart() {
        print("lineChart")
        lineChart = PNLineChart(frame: CGRectMake(0, 135, mainScreen.width, 200))
        lineChart.setXLabels(["SEP 1", "SEP 2", "SEP 3", "SEP 4", "SEP 5"], withWidth: 60)
        
//        lineChart.yFixedValueMax = 300.0
//        lineChart.yFixedValueMin = 0.0
        lineChart.backgroundColor = UIColor.clearColor()
        
        // 显示坐标轴
        lineChart.showCoordinateAxis = true
        
        // Line chart
        let dataArray = [1, 4, 5, 8, 2]
        let data1 = PNLineChartData()
        // 每根线的标题
        data1.dataTitle = "Alpha"
        // line color
        data1.color = UIColor.greenColor()
        data1.alpha = 0.3
        data1.itemCount = UInt(dataArray.count)
        // 拐点的图形
        data1.inflexionPointStyle = .Triangle
        data1.getData = { (index: UInt) -> PNLineChartDataItem in
            let yValue: CGFloat = CGFloat(dataArray[(Int)(index)])
            return PNLineChartDataItem(y: yValue)
        }
        
        let dataArray2 = [3, 7, 2, 1, 2]
        let data2 = PNLineChartData()
        data2.dataTitle = "Beta Beta Beta Beta"
        data2.color = UIColor.redColor()
        data2.alpha = 0.3
        data2.itemCount = UInt(dataArray2.count)
        data2.inflexionPointStyle = .Circle
        data2.getData = { (index: UInt) -> PNLineChartDataItem in
            let yValue: CGFloat = CGFloat(dataArray2[(Int)(index)])
            return PNLineChartDataItem(y: yValue)
        }
        
        lineChart.chartData = [data1, data2]
        lineChart.strokeChart()
        self.view.addSubview(lineChart)
        
        lineChart.legendStyle = .Serial
        lineChart.legendFont = UIFont.boldSystemFontOfSize(CGFloat(12))
        lineChart.legendFontColor = UIColor.blueColor()
        
        legend = lineChart.getLegendWithMaxWidth(mainScreen.width)
        legend.frame = CGRectMake(40, 340, mainScreen.width, 100)
        self.view.addSubview(legend)
        self.lineChart.delegate = self
    }
    
    func BarChart() {
        print("barChart")
        
        let barChart = PNBarChart(frame: CGRectMake(0, 135, mainScreen.width, 200))
        barChart.backgroundColor = UIColor.clearColor()
        barChart.xLabels = ["SEP 1", "SEP 2", "SEP 3", "SEP 4", "SEP 5"]
        barChart.yValues = ["1", "10", "2", "6", "5"]
        
        // 显示x y坐标的线
        barChart.showChartBorder = true
//        barChart.labelMarginTop = 5.0
        
//        let barChartFormatter = NSNumberFormatter()
//        barChartFormatter.numberStyle = .CurrencyStyle
//        barChartFormatter.allowsFloats = false
//        barChartFormatter.maximumFractionDigits = 0
//        barChart.yLabelFormatter = { (yValue: CGFloat) -> String in
//            return barChartFormatter.stringFromNumber(NSNumber(float: Float(yValue)))!
//        }
//        barChart.yChartLabelWidth = 20.0
//        barChart.chartMarginLeft = 30.0
//        barChart.chartMarginRight = 10.0
//        barChart.chartMarginTop = 5.0
//        barChart.chartMarginBottom = 10.0
        
//        barChart.showLevelLine = true
//        barChart.showLabel = true
        
//        barChart.isGradientShow = true
        // 不显示数字在bar上
        barChart.isShowNumbers = false
        barChart.strokeChart()
        self.view.addSubview(barChart)
        
    }
    
    func CircleChart() {
        print("circleChart")
        
        // clockwise为true顺时针，false逆时针
        let circleChart = PNCircleChart(frame: CGRectMake(0, 150, mainScreen.width, 100), total: 100, current: 60, clockwise: false)
        circleChart.backgroundColor = UIColor.clearColor()
        circleChart.strokeColor = UIColor.greenColor()
//        circleChart.strokeColorGradientStart = UIColor(red: 77, green: 196, blue: 122, alpha: 0.5)
        circleChart.strokeChart()
        
        self.view.addSubview(circleChart)
        
    }
    
    func PieChart() {
        print("pieChart")
        
        let item1 = PNPieChartDataItem(value: CGFloat(10), color: UIColor.redColor(), description: "电脑")
        let item2 = PNPieChartDataItem(value: CGFloat(20), color: UIColor.blueColor(), description: "家具")
        let item3 = PNPieChartDataItem(value: CGFloat(40), color: UIColor.greenColor(), description: "厨房")
        let items = [item1, item2, item3]
        let pieChart = PNPieChart(frame: CGRectMake(mainScreen.width/2 - 100, 150, 200, 200), items: items)
        pieChart.descriptionTextColor = UIColor.whiteColor()
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 11.0)
        pieChart.descriptionTextShadowColor = UIColor.clearColor()
        pieChart.showAbsoluteValues = false
        pieChart.showOnlyValues = false
        pieChart.strokeChart()
        self.view.addSubview(pieChart)
    }
    
    /**
     update Charts
     
     - parameter sender:
     */
    @IBAction func updateChart(sender: UIButton) {
        if chartType == "Line Chart" {
            let dataArray = [10, 5, 15, 2, 1]
            let data1 = PNLineChartData()
            // 每根线的标题
            data1.dataTitle = "Alpha"
            // line color
            data1.color = UIColor.brownColor()
            data1.alpha = 0.3
            data1.itemCount = UInt(dataArray.count)
            // 拐点的图形
            data1.inflexionPointStyle = .Triangle
            data1.getData = { (index: UInt) -> PNLineChartDataItem in
                let yValue: CGFloat = CGFloat(dataArray[(Int)(index)])
                return PNLineChartDataItem(y: yValue)
            }
            
            let dataArray2 = [6, 7, 12, 4, 3]
            let data2 = PNLineChartData()
            data2.dataTitle = "projects"
            data2.color = UIColor.yellowColor()
            data2.alpha = 0.3
            data2.itemCount = UInt(dataArray2.count)
            data2.inflexionPointStyle = .Circle
            data2.getData = { (index: UInt) -> PNLineChartDataItem in
                let yValue: CGFloat = CGFloat(dataArray2[(Int)(index)])
                return PNLineChartDataItem(y: yValue)
            }
            
            self.lineChart.xLabels = ["project1", "project2", "project3", "project4", "project5"]
            self.lineChart.updateChartData([data1, data2])
            self.lineChart.strokeChart()
            
            self.legend.removeFromSuperview()
            
            self.legend = self.lineChart.getLegendWithMaxWidth(mainScreen.width)
            self.legend.frame = CGRectMake(40, 340, mainScreen.width, 100)
            self.view.addSubview(self.legend)
        }
    }

    /**
    *  PNChartDelegate
    */
    func userClickedOnLinePoint(point: CGPoint, lineIndex: Int) {
        print("\(lineIndex): \(point)")
    }
    
    func userClickedOnLineKeyPoint(point: CGPoint, lineIndex: Int, pointIndex: Int) {
        
    }
}
