//
//  learnswift03.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/18/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

//protocol and extend
import Foundation

protocol ExampleProtocol {
    var simpleDescription: String {
        get
    }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

//扩展
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

//泛型
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

func anyCommonElements<T: SequenceType, U: SequenceType where
    T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _rhs: U) -> Bool {
        for lhsItem in lhs {
            for rhsItem in _rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}

//返回一个数组，内容是两个序列的共有元素
func anyCommonElements2<T: SequenceType, U: SequenceType where
    T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _rhs: U) -> Bool {
        for lhsItem in lhs {
            for rhsItem in _rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}

class MainTest {
    func test1() {
        let intExtension = 7.simpleDescription
        println(intExtension)
        let repeat = repeatItem("knock", 4)
        println(repeat)
        var possibleInteger: OptionalValue<Int> = .None
        possibleInteger = .Some(100)
        let b = anyCommonElements([1,2,3],[3])
        println(b)
    }
}
