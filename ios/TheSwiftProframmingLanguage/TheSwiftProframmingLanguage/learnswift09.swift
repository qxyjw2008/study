//
//  learnswift09.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/24/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

/// create enum
class CreateEnum {
    
    enum CompassPoint {
        case North
        case South
        case East
        case West
    }
    
    //条形码枚举
    enum Barcode {
        case UPCA(Int, Int, Int, Int)
        case QRCode(String)
    }
    
    //原始值
    enum ASCIIControlCharacter: Character {
        case Tab = "\t"
        case LineFeed = "\n"
        case CarriageReturn = "\r"
    }
    
    //原始值的隐式赋值，第一个有值，下面依次+1，第一个没赋值，默认为0
    enum Planet: Int {
        case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
    }
    
    //xcode7.0支持
//    enum CompassPoint: String {
//        case North, South, East, West
//    }
    
    //可以在枚举成员前加上indirect来表示这成员可递归
    //xcode7.0支持
    enum ArithmeticExpression {
        case Number(Int)
        //indirect case Addition(ArithmeticExpression, ArithmeticExpression)
        //indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    /*indirect enum ArithmeticExpression {
        case Number(Int)
        case Addition(ArithmeticExpression, ArithmeticExpression)
        case Multiplication(ArithmeticExpression, ArithmeticExpression)
    }*/
    
    func createEnum() {
        var directionToHead = CompassPoint.West
        directionToHead = .East
        
        //匹配switch
        directionToHead = .South
        switch directionToHead {
        case .North:
            print("Lots of planets have a north", terminator: "")
        case .South:
            print("Watch out for penguins", terminator: "")
        case .East:
            print("Where the sun rises", terminator: "")
        case .West:
            print("Where the skies are blue", terminator: "")
        }
        // 输出 "Watch out for penguins”
        
        //产品条形码
        var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
        productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
        
        switch productBarcode {
        case .UPCA(let numberSystem, let manufacturer, let product, let check):
            print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).", terminator: "")
        case .QRCode(let productCode):
            print("QR code: \(productCode).", terminator: "")
        }
        // 输出 "QR code: ABCDEFGHIJKLMNOP."
        
        let possiblePlanet = Planet(rawValue: 7)
        // possiblePlanet 类型为 Planet? 值为 Planet.Uranus
        
    }
}