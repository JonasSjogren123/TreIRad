//
//  BoardCell.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-12-06.
//

import Foundation

class Cell : Equatable{
    
    var player : Player
   
     init (player : Player) {
        self.player = player
    }
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        return lhs.player.term == rhs.player.term
    }
    
    
}
