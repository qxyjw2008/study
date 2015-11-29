//
//  learnswift07.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/21/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

/// 函数
class Functions {
    
    /**
    取得数组的最小值和最大值
    
    - parameter array: Int类型的数组
    
    - returns: (min, max)
    */
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        //安全性检查
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[0..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    //本地参数名称
    func someFunction(firstParameterName: Int, secondParameterName: Int) {
        print("\(firstParameterName), \(secondParameterName)")
    }
    //外部参数名称
    func sayHello(to person: String, and anotherPerson: String) {
        print("Hello \(person) and \(anotherPerson)")
    }
    //忽略参数名称，使用_
    func ignoreFunction(firstParameterName: Int, _ secondParameterName: Int) {
        print("\(firstParameterName), \(secondParameterName)")
    }
    //默认的参数值
    func defaultFunction(firstParameterName: Int = 12) {
        print("the parameter is \(firstParameterName)")
    }
    //可变参数，求平均值
    func arithmeticMean(numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        print(total / Double(numbers.count))
        return total / Double(numbers.count)
    }
    
    func alignRight(var string: String, totalLength: Int, alignChar: Character) -> String {
        let length = totalLength - string.characters.count
        if length < 1 {
            print("\(string) length >= totalLength")
            return string
        }
        let padString = String(alignChar)
        for _ in 0..<length {
            string = padString + string
        }
        print(string)
        return string
    }
    
    /**
    输入输出参数
    参数前加 inout 关键字
    只能将变量作为输入输出参数，不能传入常量或者字面量，因为这些量是不能被修改的，当传入的参数作为输入输出参数时，需要在参数前加 & 符号，表示这个值可以被修改
    - parameter a: <#a description#>
    - parameter b: <#b description#>
    */
    func swapTwoInts(inout a: Int, inout _ b: Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func addTwoInts(a: Int, _ b: Int) -> Int {
        return a + b;
    }
    
    func multiplyTwoInts(a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("printMathResult: \(mathFunction(a, b))")
    }
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    func chooseStepFunction(check: Bool) -> (Int) -> Int {
        return check ? stepForward : stepBackward
    }
    
    func test() {
        let array1 = [8, -6, 2, 109, 3, 71]
//        let array2 = [Int]()
        if let bounds = minMax(array1) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        } else {
            print("the array is null")
        }
        someFunction(1, secondParameterName: 2) //1, 2
        sayHello(to: "Bill", and: "Ted")    //Hello Bill and Ted
        ignoreFunction(1, 2)    //1, 2
        defaultFunction(6)  //6
        defaultFunction()   //12
        arithmeticMean(1,2,3,4,5)
        alignRight("hello", totalLength: 10, alignChar: "-")
        
        //输入输出参数的使用
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
        //使用函数类型
        var mathFunction: (Int, Int) -> Int = addTwoInts
        print("result: \(mathFunction(2, 3))")    //5
        mathFunction = multiplyTwoInts
        print("result: \(mathFunction(2, 3))")    //6
        //函数类型作为函数参数
        printMathResult(addTwoInts, 3, 5)
        //函数类型作为返回参数
        let chooseFunction = chooseStepFunction(true)
        print(chooseFunction(1))
    }
}