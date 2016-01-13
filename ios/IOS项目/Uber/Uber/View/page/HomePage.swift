//
//  HomePage.swift
//  Uber
//
//  Created by Benjamin on 1/12/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class HomePage: FxBasePage {
    
    var isShowLeftPage: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem("Left", selector: Selector("shoeLeft"), isRight: false)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        isShowLeftPage = false
    }

    @IBAction func shoeLeft() {
        if isShowLeftPage! {
            
        }
    }
    
}
