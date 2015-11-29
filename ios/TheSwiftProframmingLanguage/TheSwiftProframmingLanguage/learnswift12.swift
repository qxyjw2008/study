//
//  learnswift12.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/25/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//Method

struct Point2 {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

//结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
//你可以选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

//在变异方法中给self赋值
struct Point4 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point4(x: x + deltaX, y: y + deltaY)
    }
}

enum triStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}

//the game of LevelTracker
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playName = name
    }
}

class CreateMethods {
    func createMethods() {
        let somePoint = Point2(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOfX(1.0) {
            print("This point is to the right of the line where x == 1.0", terminator: "")
        }
        // 打印输出: This point is to the right of the line where x == 1.0
        
        var ovenLight = triStateSwitch.Low
        ovenLight.next()
        // ovenLight 现在等于 .High
        ovenLight.next()
        // ovenLight 现在等于 .Off
        
        var player = Player(name: "Jack")
        player.completedLevel(1)
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        
        player = Player(name: "benjamin")
        if player.tracker.advanceToLevel(6) {
            print("player is on level6")
        } else {
            print("level 6 has not yet been unlocked")
        }
    }
}
