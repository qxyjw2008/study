//
//  FxURLDefine.swift
//  Uber
//
//  Created by Benjamin on 1/2/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import Foundation

/**
 根据是否为上线版本切换服务器地址
 */
func ServerAddress() -> String {
    #if AppStore
        return "http://www.uber.com"
    #else
        return "http://172.16.19.11"
    #endif
}

let YLTnURL = "http://101.231.204.84:8091/sim/getacptn"