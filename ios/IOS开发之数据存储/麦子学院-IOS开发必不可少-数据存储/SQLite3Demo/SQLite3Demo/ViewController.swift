//
//  ViewController.swift
//  SQLite3Demo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var documentsPath: String = {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }()

    var db: COpaquePointer = nil
    var stmt: COpaquePointer = nil
    var string: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(documentsPath)
        //创建或打开数据库
        createOrOpenDatabase()
        createTable()
        defer {
            sqlite3_close(db)
        }
//        insertStudents()
        queryStudents()
    }
    
    func createOrOpenDatabase() {
        let path: NSString = "\(documentsPath)/test.sqlite3"
        let filename = path.UTF8String
        
        if sqlite3_open(filename, &db) != SQLITE_OK {
            print("create or open failed...")
            sqlite3_close(db)
        }
    }
    
    func createTable() {
        string = "create table if not exists Student(id integer primary key autoincrement, sno text, name text, score integer)"
        operate(string, operation: "create table")
    }
    
    func insertStudents() {
        let strs1 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
        let strs2 = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
        
        for i in 0..<100 {
            let sno = "\(1001 + i)"
            let name = strs1[i / 10] + strs2[i % 10]
            let score = i
            insertStudent(sno: sno, name: name, score: score)
        }
    }
    
    func insertStudent(sno sno: String, name: String, score: Int) {
        string = "insert into Student(sno, name, score) values(?, ?, ?)"
        let sql = string.UTF8String
        
        //预处理
        if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) != SQLITE_OK {
            print("\(sno), insert failed...")
            sqlite3_close(db)
        }
        
        //绑定参数
        let csno = (sno as NSString).UTF8String
        let cname = (name as NSString).UTF8String
        
        sqlite3_bind_text(stmt, 1, csno, -1, nil)
        sqlite3_bind_text(stmt, 2, cname, -1, nil)
        sqlite3_bind_int(stmt, 3, Int32(score))
        
        if sqlite3_step(stmt) == SQLITE_ERROR {
            print("\(sno), insert failed...")
            sqlite3_close(db)
        } else {
            //释放资源
            sqlite3_finalize(stmt)
        }
    }
    
    func queryStudents() {
//        let string: NSString = "select sno, name, score from Student"
        string = "select sno,name, score from Student where score > 80"
        let sql = string.UTF8String
        
        if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) != SQLITE_OK {
            print("query failed...")
            sqlite3_close(db)
            return
        }
        
        //执行sql语句
        while sqlite3_step(stmt) == SQLITE_ROW {
            let csno = sqlite3_column_text(stmt, 0)
            let sno = NSString(UTF8String: UnsafePointer(csno))!
            let cname = sqlite3_column_text(stmt, 1)
            let name = NSString(UTF8String: UnsafePointer(cname))!
            let score = sqlite3_column_int(stmt, 2)
            print("\(sno), \(name), \(score)")
        }
        
        sqlite3_finalize(stmt)
    }
    
    func updateStudents() {
        string = "update Student set score = 100 where name like 'a%'"
        operate(string, operation: "update")
    }
    
    func deleteStudents() {
        string = "delete from Student where score < 60"
        operate(string, operation: "delete")
    }

    func operate(string: NSString, operation: String) {
        let sql = string.UTF8String
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK {
            print("\(operation) failed...")
            sqlite3_close(db)
        }
    }
}

