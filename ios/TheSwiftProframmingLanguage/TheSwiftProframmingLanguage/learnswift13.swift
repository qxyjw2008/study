//
//  learnswift13.swift
//  TheSwiftProframmingLanguage
//
//  Created by Benjamin on 10/25/15.
//  Copyright (c) 2015 Benjamin. All rights reserved.
//

import Foundation

//SubScripts下标脚本

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows*columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[row*columns + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[row*columns + column] = newValue
        }
    }
}

class CreateSubScripts {
    func createSubScripts() {
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0,1] = 1.5
        matrix[1,0] = 3.2
        print(matrix.grid)
        //[0.0, 1.5, 3.2, 0.0]
    }
}