//
//  learnswift08.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/21/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

class Closure {
    func backwards(s1: String, s2: String) -> Bool {
        return s1 > s2
    }
    //尾随闭包
    func someFunctionThatTakeAClosure(closure: () -> Void) {
        //do something
    }
    //捕获值
    func makeIncrementor(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    
    func test() {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversed = names.sort(backwards)
        print(reversed)
        //xcode 7.0以上用sort
        reversed = names.sort({
            (s1: String, s2: String) -> Bool in
            return s1 < s2
        })
        print(reversed)
        //以下进行简写sorted方法
//        names.sort({ s1, s2 in return s1 > s2 })
//        names.sort({ s1, s2 in s1 > s2 })
//        names.sort({ $0 > $1 })
//        names.sort(>)
        //*********************
        someFunctionThatTakeAClosure({
            //闭包主体
        })
        someFunctionThatTakeAClosure(){
            //闭包主体
        }
        //在上例中作为sorted函数参数的字符串排序闭包可以改写为：
        reversed = names.sort(){ $0 > $1 }
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        let strings = numbers.map{
            (var number) -> String in
            var output = ""
            while number > 0 {
                output = digitNames[number % 10]! + output
                number /= 10
            }
            return output
        }
        print(strings)
        
        //捕获值
        let incrementByTen = makeIncrementor(forIncrement: 10)
        print(incrementByTen())   //10
        print(incrementByTen())   //20
        print(incrementByTen())   //30
        let incrementBySeven = makeIncrementor(forIncrement: 7)
        print(incrementBySeven()) //7
        print(incrementByTen())   //40
        
        //无论您将函数/闭包赋值给一个常量还是变量，您实际上都是将常量/变量的值设置为对应函数/闭包的引用。 上面的例子中，incrementByTen指向闭包的引用是一个常量，而并非闭包内容本身。
        //这也意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包：
        let alsoIncrementByTen = incrementByTen
        alsoIncrementByTen()
        // 返回的值为50
    }
}