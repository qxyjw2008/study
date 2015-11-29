//
//  learnswift06.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/20/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//控制流
class ControFlow {
    
    /**
    for
    */
    func createFor() {
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //不需要知道循环每项的值，用 _ 代替
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        print("\(base) to the power of \(power) is \(answer)")
        
        var index: Int
        for index = 0; index < 3; ++index {
            print("index is \(index)", terminator: "")
        }
        // index is 0
        // index is 1
        // index is 2
        print("The loop statements were executed \(index) times", terminator: "")
        // 输出 "The loop statements were executed 3 times
    }
    
    /**
    while
    */
    func createWhile() {
        //梯子和小蛇的游戏
        let finalSquare = 25
        var board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
        var square = 0
        var diceRoll = 0
        while square < finalSquare {
            if (++diceRoll) == 7 { diceRoll = 1 }
            square += diceRoll
            print("\(square),", terminator: "")
            if square < board.count {
                square += board[square]
            }
        }
        print("Game Over!")
    }
    
    /**
    switch
    */
    func createSwitch() {
        //区间匹配
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        var naturalCount: String
        switch approximateCount {
//        case 0:
//            naturalCount = "no"
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        case 100..<1000:
            naturalCount = "hundreds of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings)")
    }
    
    /**
    元组
    */
    func createTuple() {
        //匹配坐标，使用_来匹配所有可能的值
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("(0, 0) is at the origin")
        case (_, 0):
            print("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            print("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside the box")
        }
        
        //值匹配
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with an y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        
        //Where
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        
        //Fallthrough 贯穿
        let integerToScribe = 5
        var description = "The number \(integerToScribe) is"
        switch integerToScribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        
        //label
        let finalSquare = 25
        var board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        gameLoop: while square != finalSquare {
            if (++diceRoll) == 7 { diceRoll = 1}
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        print("Game Over!")
    }
}