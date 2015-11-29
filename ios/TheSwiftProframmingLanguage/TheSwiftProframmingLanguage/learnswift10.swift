//
//  learnswift10.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/24/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//类和结构体
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

class ClassAndStruct {
    func createClassAndStruct() {
        //结构体类型的成员逐一构造器
//        let vga = Resolution(width: 640, height: 480)
        //结构体和枚举是值类型
        //类是引用类型
        let hd = Resolution(width: 1920, height: 1080)
        
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)", terminator: "")
        // 输出 "The frameRate property of theEighty is now 30.0"
        
        /**
        *  恒等运算符 === !==
        */
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same Resolution instance.", terminator: "")
        }
        //输出 "tenEighty and alsoTenEighty refer to the same Resolution instance."
    }
}