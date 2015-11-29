//
//  ViewController.swift
//  CoreDataStackDemo
//
//  Created by Benjamin on 11/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        insertStudents()
//        fetchStudents()
//        countStudents()
//        countAverage()
        
//        updateStudents()
        
        deleteStudents()
        fetchStudents()
    }

}

let context = CoreDataStack.defaultStack().context

extension ViewController {
    
    //插入数据
    func insertStudents() {
        let strs1 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
        let strs2 = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
        
        for i in 0..<100 {
            let sno = "\(1000 + i)"
            let name = strs1[i / 10] + strs2[i % 10]
            let score = i
            insertStudent(sno: sno, name: name, score: score)
        }
        CoreDataStack.defaultStack().saveContext()
    }
    
    func insertStudent(sno sno: String, name: String, score: Int) {
        //构建实体对象
        let student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: context) as! Student
        student.sno = sno
        student.name = name
        student.score = score
    }
    
    //查询数据
    func fetchStudents() {
        //构建抓取请求
        let request = NSFetchRequest(entityName: "Student")
        //指定按学号升序排列
        let sort = NSSortDescriptor(key: "sno", ascending: true, selector: "localizedStandardCompare:")
        request.sortDescriptors = [sort]
        //构建查询条件
//        request.predicate = NSPredicate(format: "score > 60")
//        request.predicate = NSPredicate(format: "name like 'a*'")
        do {
            let students = try (context.executeFetchRequest(request)) as! [Student]
            for student in students {
                print("\(student.sno!), \(student.name!), \(student.score!)")
            }
        } catch {
            print("fetch failed...")
        }
    }
    
    //统计信息
    func countStudents() {
        let request = NSFetchRequest(entityName: "Student")
        request.predicate = NSPredicate(format: "score > 90")
        request.resultType = .CountResultType
        
        do {
            let entries = (try context.executeFetchRequest(request))
            let count = entries.first!.integerValue
            print("Count: \(count)")
        } catch {
            print("fetch failed...")
        }
    }
    
    func countAverage() {
        let request = NSFetchRequest(entityName: "Student")
        request.resultType = .DictionaryResultType
        
        //构建表达式
        let description = NSExpressionDescription()
        description.name = "AverageScore"
        let args = [NSExpression(forKeyPath: "score")]
        description.expression = NSExpression(forFunction: "average:", arguments: args)
        description.expressionResultType = .FloatAttributeType
        
        request.propertiesToFetch = [description]
        do {
            let entries = (try context.executeFetchRequest(request))
            let result = entries.first! as! NSDictionary
            let averageScore = result["AverageScore"]!
            print("Average: \(averageScore)")
        } catch {
            print("fetch failed...")
        }
    }
    
    func updateStudents() {
        let request = NSFetchRequest(entityName: "Student")
        request.predicate = NSPredicate(format: "name like 'a*'")
        
        do {
            let students = (try context.executeFetchRequest(request)) as! [Student]
            for student in students {
                student.score = 100
            }
        } catch {
            print("fetch failed...")
        }
        //保存
        CoreDataStack.defaultStack().saveContext()
        //备注：批量更新 & 异步操作
    }
    
    func deleteStudents() {
        let request = NSFetchRequest(entityName: "Student")
        request.predicate = NSPredicate(format: "score < 60")
        
        do {
            let students = (try context.executeFetchRequest(request)) as! [Student]
            for student in students {
                context.deleteObject(student)
            }
        } catch {
            print("delete failed...")
        }
        CoreDataStack.defaultStack().saveContext()
    }
}
