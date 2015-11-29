//
//  Student.swift
//  ArchiveDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import Foundation

class Student: NSObject, NSCoding {
    
    var sno: String!
    var name: String!
    var score: Int!
    
    init(sno: String, name: String, score: Int) {
        self.sno = sno
        self.name = name
        self.score = score
    }
    
    //解码
    required init?(coder aDecoder: NSCoder) {
        sno = aDecoder.decodeObjectForKey("sno") as! String
        name = aDecoder.decodeObjectForKey("name") as! String
        score = aDecoder.decodeObjectForKey("score") as! Int
    }
    
    //编码
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(sno, forKey: "sno")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(score, forKey: "score")
    }
}