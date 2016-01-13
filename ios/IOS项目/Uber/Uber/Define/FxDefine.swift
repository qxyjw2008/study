//
//  FxDefine.swift
//  Uber
//
//  Created by Benjamin on 1/2/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import Foundation
import UIKit

let LoadingTip = "加载中..."
let iOS8: Float = 8.0
let screenHeight = UIScreen.mainScreen().bounds.size.height
let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenMaxLength = max(screenWidth, screenHeight)
let screenMinLength = min(screenHeight, screenWidth)


// 如果想让日志打印，要在”Build Setting”–>“Swift Compiler-Custom Flags”–>“Other Swift Flags”–>“Debug”中添加所需要的配置选项，我加上的是 -D DEBUG_PRINT
func FxLog(message: String, function: String = __FUNCTION__) {
    #if DEBUG_PRINT
        print("log: \(message), \(function)")
    #else
        
    #endif
}

func isIphone5() -> Bool{
    
    #if os(iOS)
        FxLog("ios")
    #elseif os(OSX)
        FxLog("osx")
    #endif
    
    return screenMaxLength == 568
}