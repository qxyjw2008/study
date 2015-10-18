//
//  practice01.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/17/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//  Contains Class -> Tour
//

import Foundation

class Tour {
    
    /**********************************************************************
    简单值
    */
    func simpleValue() {
        //let声明常量，var声明变量
        var myVariable = 20
        myVariable = 50
        let myConstant = 42
        //明确指定类型在:后面指定类型
        let implicitInteger = 70
        let implicitDouble = 70.0   //implicit隐式
        let explicitDouble: Double = 70 //explicit显式
        //需要把一个值转换成其它类型，显示转换
        let label = "The width is"
        let width = 94
        let widthLabel = label + String(width)
        //更简单地方式转换字符串
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."    //summary摘要
        let fruitSummary = "I have \(apples + oranges) pieces of fruit."
        //[]创建数组和字典，并使用下标或者key来访问元素
        var shoppingList = ["catfish", 123, "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        //[catfish, bottle of water, tulips, blue paint]
        println(shoppingList)
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic"
        ]
        occupations["Jayne"] = "Public Releations"
        //[Kaylee: Mechanic, Jayne: Public Releations, Malcolm: Captain]
        println(occupations)
        println(occupations["Malcolm"]!)
        //创建一个空数组或字典
        let emptyArray = [String]()
        let emptyDictionary = [String: Float]()
        //如果类型可以推断出来，我们可以使用[]和[:]来创建空数组和字典
        shoppingList = []
        occupations = [:]
    }
    
    
    /**********************************************************************
    控制流
    */
    func controlFlow() {
        // if else
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        println(teamScore)
        //一个可选的值是一个具体的值或者是nil以表示值缺失
        var optionalString: String? = "Hello"
        println(optionalString == nil)
        
        var optionalName: String? = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
        }
        println(greeting)
        
        //switch支持任意类型的数据以及各种比较操作
        let vegetable = "red pepper"    //vegetable蔬菜 pepper辣椒
        switch vegetable {
            case "celery":
                println("Add some raisins and make ants on a log.")
            case "cucumber", "watercress":
                println("That would make a good tea sandwich.")
            case let x where x.hasSuffix("pepper"):
                println("Is it a spicy \(x)?")
            default:
                println("Everything tastes good in soup.")
        }
        // for-in
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square":[1, 4, 9, 16, 25]
        ]
        var largest = 0
        var largestType = ""
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                    largestType = kind
                }
            }
        }
        println("\(largest)," + largestType)
        
        //while
        var n = 2
        while n < 100 {
            n = n * 2
        }
        println(n)
        
        var m = 2
        do {
            m = m * 2
        } while m < 100
        println(m)
        
        //使用..< 来表示范围(不包含上界)，需要包含使用...
        var firstForLoop = 0
        for i in 0..<4 {    //等价于for var i = 0;i < 4; ++i
            firstForLoop += i
        }
        println(firstForLoop)
    }
}

/**********************************************************************
函数和闭包
*/
class functionsAndClosure {
    func greet(name: String, day: String) -> String {
        return "Hello \(name), today is \(day)."
    }
    //使用元组
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        for score in scores {
            if score < min {
                min = score
            } else if score > max {
                max = score
            }
            sum += score
        }
        return (min, max, sum)
    }
    //可变参数
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    func calculateAverage(numbers: Int...) -> Double {
        var sum:Double = 0
        for number in numbers {
            sum += Double(number)
        }
        return sum/Double(numbers.count)
    }
    
    //函数嵌套
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    //可以返回一个函数
    //这么调用： makeIncrementer()(7, 2.2)
    func makeIncrementer() -> ((Int, Double) -> Int) {  //((Int, Double) -> Int)为返回函数的参数类型->返回值
        func addTwo(number: Int, number2: Double) -> Int {
            return 1 + number + Int(number2)
        }
        return addTwo
    }
    //函数作为参数传入
    func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    // hasAnyMatches(numbers, condition: lessThanTen)
    var numbers = [20, 19, 7, 12]
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    //闭包 使用in将参数和返回值类型声明与闭包函数体进行分离
    
    
    
}