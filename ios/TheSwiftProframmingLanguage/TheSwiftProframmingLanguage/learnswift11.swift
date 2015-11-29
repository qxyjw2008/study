//
//  learnswift11.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/24/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//properties属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class DataImporter {
    /*
    DataImporter 是一个将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这是提供数据导入功能
}

class DataManager {
    //延迟加载
    lazy var importer = DataImporter()
    var data = [String]()
    // 这是提供数据管理功能
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width/2)
//            origin.y = newCenter.y - (size.height/2)
//        }
        //或者这种简单写法
        set {
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}

//willSet在新的值被设置之前调用
//didSet在新的值被设置之后立即调用
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将新电平值设置为阀值
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前电平值作为新的最大输入电平
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

//static
struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int {
        return 27
    }
    //子类重写父类属性需要加上class
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
class CreateProperties {
    
    func createProperties() {
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // 该区间表示整数0，1，2
        rangeOfThreeItems.firstValue = 6
        // 该区间现在表示整数6，7，8
        
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        // DataImporter 实例的 importer 属性还没有被创建
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
//        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // 输出 "square.origin is now at (10.0, 10.0)”
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896
        
        //可以使用结构体AudioChannel来创建表示立体声系统的两个声道leftChannel和rightChannel：
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        // 输出 "7"
        print(AudioChannel.maxInputLevelForAllChannels)
        // 输出 "7"
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        // 输出 "10"
        print(AudioChannel.maxInputLevelForAllChannels)
        // 输出 "10"
        print(SomeClass.computedTypeProperty)
    }
}