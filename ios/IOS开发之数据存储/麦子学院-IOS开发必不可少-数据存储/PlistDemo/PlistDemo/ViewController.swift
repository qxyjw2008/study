//
//  ViewController.swift
//  PlistDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var documentsPath: String = {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(documentsPath)
        arrayTest()
        dictionaryTest()
    }

    func arrayTest() {
        //数组的操作
        print("===============>>>Array")
        //构建路径
        let namesPath = "\(documentsPath)/names.plist"
        
        //名字的数组
        let names: NSArray = ["aaa", "bbb", "ccc", "benjamin"]
        //atomically 为true：先写到临时文件，没有错误再覆盖，为false：直接覆盖
        names.writeToFile(namesPath, atomically: true)
        
        //读取数据，输出结果
        let entries = NSArray(contentsOfFile: namesPath)!
        print(entries)
    }
    
    func dictionaryTest() {
        //字典的操作
        print("===============>>>Directory")
        //构建路径
        let studentsPath = "\(documentsPath)/students.plist"
        
        //学生的字典
        let students: NSDictionary = ["sno": "1101", "name": "benjamin", "score": 100]
        students.writeToFile(studentsPath, atomically: true)
        
        //读取数据，输出结果
        let data = NSDictionary(contentsOfFile: studentsPath)!
        print(data)
    }
}

