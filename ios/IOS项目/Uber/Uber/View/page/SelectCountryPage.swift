//
//  SelectCountryPage.swift
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class SelectCountryPage: FxBasePage, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var countries: [CountryInfo]?
    var headers: [String]?
    var dicDatas: [String: [CountryInfo]]?
    let identityId = "Cell"
    
    override func viewDidLoad() {
        self.view.superview
        super.viewDidLoad()
        self.title = "选择国家/地区"
        setNavigationItem("取消", selector: "doBack", isRight: false)
        initCountry()
        initDatas()
        
        //创建可重用的单元格
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identityId)
        self.tableView.reloadData()
    }
    
    /**
     初始化国家
     */
    private func initCountry() {
        let countryCodes = NSLocale.ISOCountryCodes()
        let local: NSLocale = NSLocale.currentLocale()
        var info: CountryInfo!
        countries = []
        
        for code in countryCodes {
            info = CountryInfo()
            info.code = code
            info.name = local.displayNameForKey(NSLocaleCountryCode, value: code)!
            print(info)
            countries?.append(info)
        }
        
        //按拼音排序
        countries?.sortInPlace({ (arg1: CountryInfo, arg2: CountryInfo) -> Bool in
            return arg1.name.localizedCaseInsensitiveCompare(arg2.name) == .OrderedAscending
        })
    }

    private func initDatas() {
        var firstLetter: String!
        
        dicDatas = [:]
        headers = []
        
        for country in countries! {
            firstLetter = FxString.firstCharactor(country.name)
            var datas = dicDatas![firstLetter]
            if datas != nil {
                datas?.append(country)
                dicDatas![firstLetter] = datas
            } else {
                dicDatas![firstLetter] = [country]
            }
            if !headers!.contains(firstLetter) {
                headers?.append(firstLetter)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        var tempHeaders = headers
        tempHeaders?.append("#")
        return tempHeaders
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identityId, forIndexPath: indexPath)
        let key = headers![indexPath.section]
        let datas = dicDatas![key]
        let country = datas![indexPath.row]
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        cell.accessoryType = .None
        cell.textLabel?.text = country.name
        
        let imagePath = NSBundle.mainBundle().pathForResource(country.code, ofType: "png")
        if imagePath != nil {
            let image = UIImage(contentsOfFile: imagePath!)
            cell.imageView?.image = image
        } else {
            cell.imageView?.image = nil
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers?.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let key = headers?[section] {
            if let datas = dicDatas?[key] {
                return datas.count
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers?[section] ?? "#"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
