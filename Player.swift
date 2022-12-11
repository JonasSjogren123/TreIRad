//
//  Player.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import Foundation

class Player : Equatable {
   
    let id = UUID()
    let symbol : String
    let term : Int
    let name : String
    
    init (symbol: String, term: Int, name: String)
    {
        self.symbol = symbol
        self.term = term
        self.name = name
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.symbol == rhs.symbol
    }
    
    
}
