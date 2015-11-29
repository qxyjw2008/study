//
//  ViewController.swift
//  ArchiveDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

//对象的编码与解码
class ViewController: UIViewController {

    lazy var documentsPath: String = {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //打印documents目录地址
        print(documentsPath)
        archiveStudent()
    }

    func archiveStudent() {
        let student = Student(sno: "1101", name: "benjamin", score: 93)
        let path = "\(documentsPath)/student.archive"
        
        //归档对象
        let archive = NSKeyedArchiver.archiveRootObject(student, toFile: path)
        if archive {
            print("archive success...")
        }
        //解档操作
        let object = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as! Student
        print("\(object.sno), \(object.name), \(object.score)")
    }
}

