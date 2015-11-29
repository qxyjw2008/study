//
//  learnswift05.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/19/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

class CollectionTypes {
    /**
    数组
    */
    func createArray() {
        //创建空数组
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        //包含一个值3
        someInts.append(3)
        //变为空数组
        someInts = []
        //创建一个Double数组， 数量3 初始值0.0
        let threeDoubles = [Double](count: 3, repeatedValue: 0.0)
        print(threeDoubles)   //[0.0, 0.0, 0.0]
        let anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
        //两个数组相加
        let sixDoubles = threeDoubles + anotherThreeDoubles
        print(sixDoubles) //[0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        //用字面量构造数组
        var shoppingList: [String] = ["Eggs", "Milk"]
        //Swift可以类型推导我们可以不指定类型
//        var shoppingList2 = ["Eggs", "Milk"]
        
        //访问和修改数组
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.")
        }
        //可以使用 += 或者 append赋新值
        shoppingList.append("Flour")
        shoppingList += ["Backing Powder"]
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        //取得第一项
//        var firstItem = shoppingList[0]
        print(shoppingList)   //[Eggs, Milk, Flour, Backing Powder, Chocolate Spread, Cheese, Butter]
        shoppingList[4...6] = ["Bananas", "Apples"]
        print(shoppingList)   //[Eggs, Milk, Flour, Backing Powder, Bananas, Apples]
        shoppingList.insert("Maple syrup", atIndex: 0)
        // 索引值为0的数据项被移除
        // shoppingList 现在只有6项，而且不包括 Maple Syrup
        // mapleSyrup 常量的值等于被移除数据项的值 "Maple Syrup"
//        let mapleSyrup = shoppingList.removeAtIndex(0)
        // 数组的最后一项被移除了
        // shoppingList 现在只有5项，不包括 cheese
        // apples 常量的值现在等于 "Apples" 字符串
//        let apples = shoppingList.removeLast()
        
        for item in shoppingList {
            print(item + ", ", terminator: "")
            // Six eggs
            // Milk
            // Flour
            // Baking Powder
            // Bananas
        }
        print("")
        
        //同时需要每个数据项的值和索引值使用enumerate()
        //Xcode 7,swift 2.0支持
//        for (index, value) in shoppingList.enumerate() {
//            print("Item \(String(index + 1)): \(value)")
//        }
    }
    
    /**
    集合
    */
    func createSet() {
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.", terminator: "")
        letters.insert("a")
        // letters 现在含有1个 Character 类型的值
        letters = []
        // letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型
        
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        // favoriteGenres 被构造成含有三个初始值的集合
        //和这样的写法一样：var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
        print("I have \(favoriteGenres.count) favorite music genres.", terminator: "")
        // 打印 "I have 3 favorite music genres."
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.", terminator: "")
        } else {
            print("I have particular music preferences.", terminator: "")
        }
        favoriteGenres.insert("Jazz")
        // favoriteGenres 现在包含4个元素
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.", terminator: "")
        } else {
            print("I never much cared for that.", terminator: "")
        }
        // 打印 "Rock? I'm over it."
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.", terminator: "")
        } else {
            print("It's too funky in here.", terminator: "")
        }
        // 打印 "It's too funky in here."
        for genre in favoriteGenres {
            print("\(genre)", terminator: "")
        }
        print("")
        // Classical
        // Jazz
        // Hip hop
        
        //swift2.0 support
//        for genre in favoriteGenres.sort() {
//            print("\(genre)")
//        }
        // prints "Classical"
        // prints "Hip hop"
        // prints "Jazz
        
        //使用intersect(_:)方法根据两个集合中都包含的值创建一个新的集合
        //使用exclusiveOr(_:)方法根据在一个集合中但并不在两个集合中得值创建一个新的集合
        //使用union(_:)方法根据两个集合的值创建一个新的集合
        //使用subtract(_:)方法根据不在该集合中得值创建一个新的集合
//        let oddDigits: Set = [1, 3, 5, 7, 9]
//        let evenDigits: Set = [0, 2, 4, 6, 8]
//        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//        oddDigits.union(evenDigits)
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//        oddDigits.intersect(evenDigits)
        // []
//        oddDigits.subtract(singleDigitPrimeNumbers)
        // [1, 9]
//        oddDigits.exclusiveOr(singleDigitPrimeNumbers)
        // [1, 2, 9]
        
//        使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
//        使用isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
//        使用isSupersetOf(_:)方法来判断一个集合中包含另一个集合中所有的值。
//        使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
//        使用isDisjointWith(_:)方法来判断两个集合是否不含有相同的值。
//        let houseAnimals: Set = ["🐶", "🐱"]
//        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
//        let cityAnimals: Set = ["🐦", "🐭"]
        
//        houseAnimals.isSubsetOf(farmAnimals)
        // true
//        farmAnimals.isSupersetOf(houseAnimals)
        // true
//        farmAnimals.isDisjointWith(cityAnimals)
        // true
    }
    
    /**
    字典
    */
    func createDictionary() {
        var namesOfIntegers = [Int: String]()
        // namesOfIntegers 是一个空的 [Int: String] 字典
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers 现在包含一个键值对
        print(namesOfIntegers)    //[16: sixteen]
        namesOfIntegers = [:]
        // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        //也可以写成var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        
        if airports.isEmpty {
            print("The airports dictionary is empty.", terminator: "")
        } else {
            print("The airports dictionary is not empty.", terminator: "")
        }
        // 打印 "The airports dictionary is not empty."
        airports["LHR"] = "London"
        // airports 字典现在有三个数据项
        airports["LHR"] = "London Heathrow"
        // "LHR"对应的值 被改为 "London Heathrow
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).", terminator: "")
        }
        // 输出 "The old value for DUB was Dublin."
        airports["APL"] = "Apple Internation"
        // "Apple Internation" 不是真的 APL 机场, 删除它
        airports["APL"] = nil
        // APL 现在被移除了
        if let removedValue = airports.removeValueForKey("DUB") {
            print("The removed airport's name is \(removedValue).", terminator: "")
        } else {
            print("The airports dictionary does not contain a value for DUB.", terminator: "")
        }
        // prints "The removed airport's name is Dublin Airport."
        
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName),", terminator: "")
        }
        print("")
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)", terminator: "")
        }
        for airportName in airports.values {
            print("Airport name: \(airportName)", terminator: "")
        }
        print("")
    }
}