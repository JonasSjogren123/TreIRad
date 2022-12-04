//
//  File.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import Foundation

class Board {
    
    let empty = 0
    let Player1 = 1
    let Player2 = 4
    
    var row0 : [Int]
    var row1 : [Int]
    var row2 : [Int]
    var column0 : [Int]
    var column1 : [Int]
    var column2 : [Int]
    
    var diagonal1 : Int
    var diagonal2 : Int
    
    init() {
        row0 = [empty, empty, empty]
        row1 = [empty, empty, empty]
        row2 = [empty, empty, empty]
        
        column0 = [row0[0], row1[0], row2[0]]
        column1 = [row0[1], row1[1], row2[1]]
        column2 = [row0[2], row1[2], row2[2]]
        
        diagonal1 = row0[0] + row1[1] + row2[2]
        diagonal2 = row0[2] + row1[1] + row2[0]
    }
    
    
    
    func makeAMove() {
        row0[1] = Player1
        row1[1] = Player2
        row2[0] = Player1
        row1[0] = Player2
     //   row2[1] = Player1
      //  row1[2] = Player2
        
        print("\(row0)")
        print("\(row1)")
        print("\(row2)")
        
        checkWhoWins()
        
    }
    
    func checkWhoWins() {
        
        let sumRow0 = row0.reduce(0, +)
        let sumRow1 = row1.reduce(0, +)
        let sumRow2 = row1.reduce(0, +)
        let sumColumn0 = column0.reduce(0, +)
        let sumColumn1 = column1.reduce(0, +)
        let sumColumn2 = column2.reduce(0, +)
        
        if (sumRow0  == 3 || sumRow1 == 3 || sumRow2 == 3 || sumColumn0 == 3 || sumColumn1 == 3 || sumColumn2 == 3 || diagonal1 == 3 || diagonal2 == 3) {
        print("Player1 wins!")
        } else if (sumRow0  == 12 || sumRow1 == 12 || sumRow2 == 12 || sumColumn0 == 12 || sumColumn1 == 12 || sumColumn2 == 12 || diagonal1 == 12 || diagonal2 == 12) {
            print("Player2 wins!")
            } else {
                print("Next move!")
            }
    }
}
