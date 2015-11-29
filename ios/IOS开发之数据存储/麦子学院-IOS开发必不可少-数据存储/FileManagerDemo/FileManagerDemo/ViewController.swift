//
//  ViewController.swift
//  FileManagerDemo
//
//  Created by Benjamin on 11/18/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let fileManager = NSFileManager.defaultManager()
    
    lazy var documentsPath: String = {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }()
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        directoryTest()
        fileTest()
    }
}

extension ViewController {
    func directoryTest() {
        //检查目录(~/Documents/Data)是否存在，如果不存在，创建它
        let path = "\(documentsPath)/Data"
        print(path)
        
        //如果不存在，创建
        if !directoryOrFileExistsAtPath(path) {
            createDirectoryAtPath(path)
            directoryOrFileExistsAtPath(path)
        }
        
        //删除目录
        deleteAtPath(path)
        
        //再次检查
        directoryOrFileExistsAtPath(path)
    }
    
    func fileTest() {
        let path = "\(documentsPath)/data.txt"
        print(path)
        
        if !directoryOrFileExistsAtPath(path) {
            createFileAtPath(path)
            directoryOrFileExistsAtPath(path)
        }
        
        //删除文件
//        deleteAtPath(path)
        
        //再次检查
        directoryOrFileExistsAtPath(path)
    }
    
    //check目录是否存在
    func directoryOrFileExistsAtPath(path: String) -> Bool {
        let result = fileManager.fileExistsAtPath(path)
        if result {
            print("directory or file exists...")
        } else {
            print("directory or file not exists...")
        }
        return result
    }
    
    func createDirectoryAtPath(path: String) {
        //withIntermediateDirectories如果true，不存在父目录的话创建，反之报错。
        do {
            
            try fileManager.createDirectoryAtPath(path, withIntermediateDirectories: false, attributes: nil)
            print("create directory successfully...")
        } catch {
            print("create directory failed...")
        }
    }
    
    func createFileAtPath(path: String) {
        let success = fileManager.createFileAtPath(path, contents: nil, attributes: nil)
        if success {
            print("create file successfully...")
        } else {
            print("create file failed...")
        }
    }
    
    //删除目录和文件方法
    func deleteAtPath(path: String) {
        do {
            //path如果为目录，则把这下面的目录文件递归删除
            try fileManager.removeItemAtPath(path)
            print("delete successfully...")
        } catch {
            print("delet failed...")
        }
    }
}

