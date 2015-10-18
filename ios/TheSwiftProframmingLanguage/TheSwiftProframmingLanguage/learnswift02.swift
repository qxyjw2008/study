//
//  learnswift02.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/18/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

/// Object and Class
class Shape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//subClass override method must be declare "override"
class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

//属性可以有setter和getter
class EquilateralTriangle: Shape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

/// enum struct
class enumAndStruct {
    enum Rank: Int {
        case Ace = 1
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        func simpleDescription() -> String {
            switch self {
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                case .King:
                    return "king"
                default:
                    return String(self.rawValue)
            }
        }
        func compareEnum(enum1: Rank) -> Bool {
            return self.rawValue > enum1.rawValue
        }
    }
    let jack = Rank.Jack.simpleDescription() //jack
    let jackRawValue = Rank.Jack.rawValue   //11
    let result = Rank.Jack.compareEnum(Rank.Queen)
    
    enum Suit {
        case Spades, Hearts, Dismonds, Clubs
        func simpleDescription() -> String {
            switch self {
                case .Spades:
                    return "spades"
                case .Hearts:
                    return "hearts"
                case .Dismonds:
                    return "diamonds"
                case .Clubs:
                    return "clubs"
            }
        }
        func color() -> String {
            switch self {
            case .Spades, .Clubs:
                return "black"
            case .Hearts, .Dismonds:
                return "red"
            }
        }
    }
    let hearts = Suit.Hearts
    let heartsDescription = Suit.Hearts.simpleDescription()
    
    struct Card {
        var rank: Rank
        var suit: Suit
        func simpleDescription() -> String {
            return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        }
        //创建一副完整的扑克牌
        func createCard() -> [Card] {
            var cards = [Card]()
            let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six,
                Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
            let suits = [Suit.Clubs, Suit.Dismonds, Suit.Hearts, Suit.Spades]
            for r in ranks {
                for s in suits {
                    cards.append(Card(rank: r, suit: s))
                }
            }
            return cards
        }
    }
    //print struct Card
    func print1() {
        //宝宝每日英语之:  suit -> 花色  rank -> 大小
        let threeOfSpades = Card(rank: .Three, suit: .Spades)
        let threeOfSpadesDescription = threeOfSpades.simpleDescription()
        println(threeOfSpadesDescription)
    }
}