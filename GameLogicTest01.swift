//
//  GameLogic.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import Foundation

class GameLogicTest01 {
    
    let playerNone = Player(symbol: "_", term: 0)
    let playerA = Player(symbol: "X", term: 1)
    let playerB = Player(symbol: "O", term: 4)
    
    var row0 : [Player]
    var row1 : [Player]
    var row2 : [Player]
    
    init() {
        row0 = [playerNone, playerNone, playerNone]
        row1 = [playerNone, playerNone, playerNone]
        row2 = [playerNone, playerNone, playerNone]
    }
    
    func makeAMove() {
        row0[1] = playerA
        row1[1] = playerB
        row2[0] = playerA
        row1[0] = playerB
        row1[2] = playerA
        row2[2] = playerB
        
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

