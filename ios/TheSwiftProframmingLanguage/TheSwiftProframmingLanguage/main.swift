//
//  main.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/17/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

let tour = Tour()
//tour.simpleValue()
//tour.controlFlow()

let fc = functionsAndClosure();
//println(fc.greet("Bob", day: "Tuesday"))
//let statistics = fc.calculateStatistics([5,3,100,3,9])
//println(statistics.sum)
//println(statistics.2)
//println(fc.sumOf())
//println(fc.sumOf(42, 597, 12))
//println(fc.calculateAverage(42, 597, 11))
//println(fc.returnFifteen())
//println(fc.makeIncrementer()(7, 2.2))
//println(fc.hasAnyMatches(fc.numbers, condition: fc.lessThanTen))
//var numbers = [20, 19, 7, 12]
//numbers.map({
//    (number: Int) -> Int in
//    let result = 3 * number
//    return result
//})
//println(numbers)
//let sortedNumbers: () = numbers.sort{$0 > $1}
//println(numbers)
//let sortedNumbers2 = sorted(numbers){$0>$1}
//println(sortedNumbers2)

/***************************************************************/
//let shape = Shape(name: "Cat")
//shape.numberOfSides = 2
//var result = shape.simpleDescription()
//println(result)
//
//let test = Square(sideLength: 5.2, name: "my test square")
//var result2 = test.simpleDescription()
//println(result2)

//let triangle = EquilateralTriangle(sideLength: 2.6, name: "三角形")
//triangle.perimeter = 6
//var result3 = triangle.simpleDescription()
//println(result3)

//var triangleAndSquare = TriangleAndSquare(size: 2.2, name: "another test shape")
//println(triangleAndSquare.square.sideLength)
//println(triangleAndSquare.triangle.sideLength)
//triangleAndSquare.square = Square(sideLength: 5.6, name: "larger square")
//println(triangleAndSquare.triangle.sideLength)

//let enumStruct = enumAndStruct()
//println(enumStruct.jack)
//println(enumStruct.result)
//println(enumStruct.hearts)
//println(enumStruct.heartsDescription)
//
//enumStruct.print1()

/***************************************************************/
//protocol and extend
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
println(aDescription)
var mainTest = MainTest()
mainTest.test1()