//
//  learnswift04.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/19/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

class Basic {
    func test1() {
        let cat = "🐱"
        print(cat)    //🐱
        let paddedDouble = 000123.456
        print(paddedDouble)   //123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
        print(oneMillion) //1000000
        print(justOverOneMillion) //1000000.0000001
        let twoThousand: UInt16 = 2_000
        let one: UInt8 = 1
        let twoThousandAndOne = twoThousand + UInt16(one)
        print(twoThousandAndOne)  //2001
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi = Double(three) + pointOneFourOneFiveNine
        print(pi) //3.14159
        //类型别名
        typealias AudioSample = UInt16
//        var maxAmplitudeFound = AudioSample.min
        //布尔值
//        let orangesAreOrange = true
//        let turnipsAreDelicious = false
        //元组
        let http404Error = (404, "Not Found")
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)")
        print("The status message is \(statusMessage)")
        let http200Status = (statusCode: 200, description: "OK")
        print("The status code is \(http200Status.statusCode)")
        print("The status message is \(http200Status.description)")
        //可选类型 optional
        let possibleNumber = "123"
        //xcode7 has Int(possibleNumber)
        let convertedNumber = Int(possibleNumber)
        print(convertedNumber)
//        var serverResponseCode: Int? = 404
//        serverResponseCode = nil
//        let surveyAnswer: String?
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
            print("convertedNumber has an integer value of \(convertedNumber!).")
        }
        //可选绑定
        if let actualNumber = Int(possibleNumber) {
            print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
        } else {
            print("\'\(possibleNumber)\' could not be converted to an integer")
        }
        //隐式解析可选类型
//        let possibleString: String? = "An optional string."
//        let forcedString: String = possibleString!
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString
        print(implicitString)
    }
    
    func test2() {
        //断言, 条件为false时，触发后面的信息。
        //也可以省略断言信息，如assert(age >= 0)
        let age = -3
        assert(age >= 0, "A person's age cannot be less than zero")
    }
    
    func basicOperators() {
        //浮点数求余
        print(8.3 % 2.5)
        //空合运算符 用处在判断值是否为nil时使用默认值
        let a = "123."
        let b = 12
        print(Int(a) ?? b) //12
//        let defaultColorName = "red"
//        let userDefinedColorName: String?
//        var colorNameToUse = userDefinedColorName ?? defaultColorName
    }
    
    func stringsAndCharacters() {
        let someString = "Some string literal value"
        print(someString)
        //初始化字符串
        let emptyString = ""
//        var anotherEmptyString = String()
        if emptyString.isEmpty {
            print("Nothing to see here")
        }
        //字符串可变性
        var variableString = "Horse"
        variableString += " and carriage"
        print(variableString)
        //使用字符
        for character in "Dog!🐶".characters {
            print("\(character)" + ", ", terminator: "")
        }
        print("")
        
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)  //Cat!🐱
        
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        print(welcome)    //hello there
        var instruction = "look over"
        instruction += string2
        print(instruction)    //look over there
        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)
        print(welcome)    //hello there!
        //Unicode标量
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        let dollarSign = "\u{1F425}"
        let blackHeart = "\u{2665}"
        let sparklingHeart = "\u{1F496}"
        print(wiseWords)
        print(dollarSign)
        print(blackHeart)
        print(sparklingHeart)
        //可扩展的字符群集
        let eAcute: Character = "\u{E9}"    // é
        let combinedEAcute: Character = "\u{65}\u{301}"
        print("\(eAcute), \(combinedEAcute)")
        print(eAcute == combinedEAcute)   //true
        let prrecomposed: Character = "\u{D55C}"     // 한
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"  // ᄒ, ᅡ, ᆫ
        print(prrecomposed == decomposed) // precomposed 是 한, decomposed 是 한” true
        let regionallndicatorForUS: Character = "\u{1F1E8}\u{1F1F3}"    //CN
        print(regionallndicatorForUS)
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        //xcode 7 and above, use unusualMenagerie.characters.count replace count(unusualMenagerie)
        print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
        //访问和修改字符串
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]   //G
        greeting[greeting.endIndex.predecessor()]   //!
        greeting[greeting.startIndex.successor()]   //u
        var welcome2 = "hello"
        welcome2.insert("!", atIndex: welcome2.endIndex)
        let range = welcome2.startIndex.successor()..<welcome2.endIndex
        welcome2.removeRange(range)
        print(welcome2)   //h
    }
}