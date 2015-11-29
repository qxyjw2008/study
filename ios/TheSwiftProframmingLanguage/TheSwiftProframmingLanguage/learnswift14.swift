//
//  learnswift14.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/25/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//inheritance

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        //什么也不做，因为车辆不一定会有噪音
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

//override
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo", terminator: "")
    }
}

//重写属性
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

//重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class CreateInheritance {
    func createInheritance() {
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        // Vehicle: traveling at 0.0 miles per hour
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle: \(bicycle.description)")
        // Bicycle: traveling at 15.0 miles per hour
        
        let train = Train()
        train.makeNoise()
        // prints "Choo Choo"
        
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print("Car: \(car.description)", terminator: "")
        // Car: traveling at 25.0 miles per hour in gear 3
        
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)", terminator: "")
        // AutomaticCar: traveling at 35.0 miles per hour in gear 4
        
        
        //防止重写
        //你可以通过把方法，属性或下标脚本标记为final来防止它们被重写，只需要在声明关键字前加上final特性即可。（例如：final var, final func, final class func, 以及 final subscript）
    }
}