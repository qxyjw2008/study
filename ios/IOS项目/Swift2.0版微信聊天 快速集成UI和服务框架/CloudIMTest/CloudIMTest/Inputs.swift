//
//  Inputs.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/30/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import Foundation

struct Inputs: OptionSetType {
    var rawValue: Int
    
    static let user = Inputs(rawValue: 1 << 0)
    static let pass = Inputs(rawValue: 1 << 1)
    static let mail = Inputs(rawValue: 1 << 2)
}

//extend bool validate
extension Inputs: BooleanType {
    var boolValue: Bool {
        return self.rawValue == 0b111
    }
}

//check
extension Inputs {
    
    func isAllOk() -> Bool {
        
        let count = 3
        var found = 0
        
        for time in 0..<count where self.contains(Inputs(rawValue: 1 << time)) {
            found++
        }
        return count == found
    }
}