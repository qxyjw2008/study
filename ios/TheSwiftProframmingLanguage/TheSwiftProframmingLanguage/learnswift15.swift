//
//  learnswift15.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/25/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//initialization

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

//构造过程中常亮属性的修改
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

class CreateInitialization {
    
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    struct Point {
        var x = 0.0, y = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        init() {}
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        init(center: Point, size: Size) {
            let originX = center.x - (size.width/2)
            let originY = center.y - (size.height/2)
            //调用其他构造器
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }
    
    class Food {
        var name: String
        init(name: String) {
            self.name = name
        }
        convenience init() {
            self.init(name: "[Unnamed]")
        }
    }
    
    class RecipeIngredient: Food { //食谱材料
        var quantity: Int
        init(name: String, quantity: Int) {
            self.quantity = quantity
            super.init(name: name)
        }
        override convenience init(name: String) {
            self.init(name: name, quantity: 1)
        }
    }
    
    class ShoppingListItem: RecipeIngredient {
        var purchased = false
        var description: String {
            var output = "\(quantity) x \(name)"
            output += purchased ? "√" : "×"
            return output
        }
    }
    
    //可失败构造器
    struct Animal {
        let species: String
        init?(species: String) {
            if species.isEmpty { return nil }
            self.species = species
        }
    }
    
    //枚举的可失败构造器
    enum TemperatureUnit {
        case Kelvin, Celsius, Fahrenhiet
        init?(symbol: Character) {
            switch symbol {
            case "K":
                self = .Kelvin
            case "C":
                self = .Celsius
            case "F":
                self = .Fahrenhiet
            default:
                return nil
            }
        }
    }
    
    enum TemperatureUnit2: Character {
        case Kelvin = "K", Celsius = "C", Fahrenhiet = "F"
    }
    
    //通过闭包设置属性值
    struct CheckerBoard {
        let boardColors: [Bool] = {
            var temporaryBoard = [Bool]()
            var isBlack = false
            for i in 1...10 {
                for j in 1...10 {
                    temporaryBoard.append(isBlack)
                    isBlack = !isBlack
                }
                isBlack = !isBlack
            }
            return temporaryBoard
        }()
        func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
            return boardColors[(row * 10) + column]
        }
    }
    
    func createInitialization() {
        let f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        // 输出 "The default temperature is 32.0° Fahrenheit”
        
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        beetsQuestion.response = "I also like beets. (But not with cheese)"
        
//        let nameMeat = Food(name: "Bacon")
        // namedMeat 的名字是 "Bacon”
//        let mysteryMeat = Food()
        // mysteryMeat 的名字是 [Unnamed]
        var breakfastList = [ShoppingListItem(), ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6)]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        for item in breakfastList {
            print(item.description, terminator: "")
        }
        // 1 x orange juice ✔
        // 1 x bacon ✘
        // 6 x eggs ✘
        
        let someCreature = Animal(species: "Giraffe")
        // someCreature 的类型是 Animal? 而不是 Animal
        
        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)", terminator: "")
        }
        // 打印 "An animal was initialized with a species of Giraffe"
        let anonymousCreature = Animal(species: "")
        // anonymousCreature 的类型是 Animal?, 而不是 Animal
        
        if anonymousCreature == nil {
            print("The anonymous creature could not be initialized", terminator: "")
        }
        // 打印 "The anonymous creature could not be initialized"
        
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.", terminator: "")
        }
        // 打印 "This is a defined temperature unit, so initialization succeeded."
        
        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.", terminator: "")
        }
        // 打印 "This is not a defined temperature unit, so initialization failed."
        
        let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
        if fahrenheitUnit2 != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // prints "This is a defined temperature unit, so initialization succeeded."
        
        let unknownUnit2 = TemperatureUnit2(rawValue: "X")
        if unknownUnit2 == nil {
            print("This is not a defined temperature unit, so initialization failed.", terminator: "")
        }
        // prints "This is not a defined temperature unit, so initialization failed."
        
        let board = CheckerBoard()
        print(board.squareIsBlackAtRow(0, column: 1), terminator: "")
        // 输出 "true"
        print(board.squareIsBlackAtRow(9, column: 9), terminator: "")
        // 输出 "false"
    }
}