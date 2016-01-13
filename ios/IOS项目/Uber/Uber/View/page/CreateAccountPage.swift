//
//  CreateAccountPage.swift
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class CreateAccountPage: FxBasePage {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "创建账户"
        FxUtils.setCornerRadius(mainView, radius: 5.0)
        setNavigationItem("下一步", selector: "doNext", isRight: true)
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
    }
    
    override func doNext() {
        let userInfoPage = UserInfoPage()
        self.navigationController?.pushViewController(userInfoPage, animated: true)
    }
    
    @IBAction func selectCountry(sender: UIButton) {
        let selectCountryPage = SelectCountryPage()
        let navi = UINavigationController(rootViewController: selectCountryPage)
        self.presentViewController(navi, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
