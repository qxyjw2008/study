//: Playground - noun: a place where people can play

import UIKit

struct Inputs: OptionSetType{
    let rawValue: Int
    
    static let user = Inputs(rawValue: 1 << 0)
    static let pass = Inputs(rawValue: 1 << 1)
    static let mail = Inputs(rawValue: 1 << 2)
}

extension Inputs: BooleanType {
    var boolValue: Bool {
        return self.rawValue == 0b111
    }
}

extension Inputs {
    
    func isAllOk() -> Bool{
        let count = 3
        //找到几项
        var found = 0
        
//        for time in 0..<count {
//            if self.contains(Inputs(rawValue: 1 << time)) {
//                found++
//            }
//        }
        
        for time in 0..<count where contains(Inputs(rawValue: 1 << time)) {
            found++
        }
        
        return count == found
    }
}

let possibleInputs: Inputs = [.user, .pass, .mail]

possibleInputs.isAllOk()

if possibleInputs {
    print("ok")
}