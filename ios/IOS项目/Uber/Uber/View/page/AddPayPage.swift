//
//  AddPayPage.swift
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class AddPayPage: FxBasePage, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var datas: [PayInfo]!
    let identify = "payCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "添加付款方式"
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
        setNavigationItem("验证", selector: "doVerifyPhone", isRight: true)
        initDatas()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identify)
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    func doVerifyPhone() {
        let verifyPhonePage = VerifyPhonePage()
        let navPage = UINavigationController(rootViewController: verifyPhonePage)
        self.presentViewController(navPage, animated: true, completion: nil)
    }
    
    override func doBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func initDatas() {
        var data: PayInfo!
        let dict = ["百度钱包":"BaiDuWallet.png",
                    "银联":"YinLian.png",
                    "支付宝":"AliPay.png",
                    "国际信用卡":"CreditCard.png"]
        datas = []
        for (key,value) in dict {
            data = PayInfo()
            data.name = key
            data.icon = value
            datas.append(data)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        let data = datas[indexPath.row]
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = data.name
        cell.imageView?.image = UIImage(named: data.icon)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let yinLianPage = YinLianPage()
            self.navigationController?.pushViewController(yinLianPage, animated: true)
        }
    }

}
