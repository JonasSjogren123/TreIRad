//
//  GameLogic.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import Foundation

class GameLogicTest01 {
    
    let empty = "_"
    let circle = "O"
    let cross = "X"
    
    var row0 : [String]
    var row1 : [String]
    var row2 : [String]
    
    init() {
        row0 = [empty, empty, empty]
        row1 = [empty, empty, empty]
        row2 = [empty, empty, empty]
    }
    
    func makeAMove() {
        row0[1] = circle
        row1[1] = cross
        row2[0] = circle
        row1[0] = cross
        row1[2] = circle
        row2[2] = cross
        
        print("\(row0)")
        print("\(row1)")
        print("\(row2)")
    }
    
    /*func checkWhoWins(player p : String, row r1 : [String]) {
        
        switch r1  {
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")
        case [p,p,p]: print("\(p) wins!")

        default:
            print("\Next move!")
        }
        
        
        
    }*/
    
    
}

