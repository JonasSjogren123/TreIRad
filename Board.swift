//
//  File.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import Foundation

class Board {
    
    let playerNone = Player(symbol: "_", term: 0)
    let playerA = Player(symbol: "O", term: 1)
    let playerB = Player(symbol: "X", term: 4)
    
    var turnPlayerA: Bool = true
    var turnPlayerB: Bool = false
    
    var curentPlayerTurn : Player
    var assignPlayerToCell : Player
    //var curenCell : Cell?
    
    var playerCountA = 0
    var playerCountB = 0
    
    var row0 : [Cell]
    var row1 : [Cell]
    var row2 : [Cell]
    var column0 : [Cell]
    var column1 : [Cell]
    var column2 : [Cell]
    var diagonal1 : [Cell]
    var diagonal2 : [Cell]
    
    let cellR0C0, cellR0C1, cellR0C2, cellR1C0, cellR1C1, cellR1C2, cellR2C0, cellR2C1, cellR2C2 : Cell
    
    init() {
        self.cellR0C0 = Cell(player: playerNone)
        self.cellR0C1 = Cell(player: playerNone)
        self.cellR0C2 = Cell(player: playerNone)
        self.cellR1C0 = Cell(player: playerNone)
        self.cellR1C1 = Cell(player: playerNone)
        self.cellR1C2 = Cell(player: playerNone)
        self.cellR2C0 = Cell(player: playerNone)
        self.cellR2C1 = Cell(player: playerNone)
        self.cellR2C2 = Cell(player: playerNone)
        
        row0 = [cellR0C0, cellR0C1, cellR0C2]
        row1 = [cellR1C0, cellR1C1, cellR1C2]
        row2 = [cellR2C0, cellR2C1, cellR2C2]
        column0 = [row0[0], row1[0], row2[0]]
        column1 = [row0[1], row1[1], row2[1]]
        column2 = [row0[2], row1[2], row2[2]]
        diagonal1 = [row0[0], row1[1], row2[2]]
        diagonal2 = [row0[2], row1[1], row2[0]]
        
        curentPlayerTurn = playerA
        assignPlayerToCell = playerNone
    }

    func makeAMove(place: Int) -> Cell {
        
        var cellNumber = place
        let cell : Cell
        
        switch place {
        case 1:
            gamePlay(cellR0C0)
            cell = cellR0C0
            cellNumber = 1
        case 2:
            gamePlay(cellR0C1)
            cell = cellR0C1
            cellNumber = 2
        case 3:
            gamePlay(cellR0C2)
            cell = cellR0C2
            cellNumber = 3
        case 4:
            gamePlay(cellR1C0)
            cell = cellR1C0
            cellNumber = 4
        case 5:
            gamePlay(cellR1C1)
            cell = cellR1C1
            cellNumber = 5
        case 6:
            gamePlay(cellR1C2)
            cell = cellR1C2
            cellNumber = 6
        case 7:
            gamePlay(cellR2C0)
            cell = cellR2C0
            cellNumber = 7
        case 8:
            gamePlay(cellR2C1)
            cell = cellR2C1
            cellNumber = 8
        default:
            gamePlay(cellR2C2)
            cell = cellR2C2
            cellNumber = 9
        }
               
        checkWhoWins()
        return cell
    }
        
        func gamePlay (_ cell : Cell) -> Player{
            let cell = cell
            if cell.player.term == self.playerNone.term {
                if turnPlayerA && playerCountA < 3 {
                    cell.player = playerA
                    playerCountA += 1
                    turnPlayerA = false
                    turnPlayerB = true
                    self.curentPlayerTurn = playerB
                } else if turnPlayerB && playerCountB < 3 {
                    cell.player = playerB
                    self.assignPlayerToCell = playerB
                    playerCountB += 1
                    turnPlayerA = true
                    turnPlayerB = false
                    self.curentPlayerTurn = playerA
                }
            } else if cell.player.term == self.playerA.term {
                if (turnPlayerA == true) && playerCountA > 2 {
                    cell.player = playerNone
                    playerCountA -= 1
                    turnPlayerA = true
                    turnPlayerB = false
                    self.curentPlayerTurn = playerA
                } else {}
            } else if cell.player.term == self.playerB.term {
                if (turnPlayerB == true) && playerCountB > 2 {
                    cell.player = playerNone
                    playerCountB -= 1
                    turnPlayerA = false
                    turnPlayerB = true
                    self.curentPlayerTurn = playerB
                } else {}
            }
            
            switch cell.player.term {
            case 1:
                assignPlayerToCell = playerA
            case 4:
                assignPlayerToCell = playerB
            default:
                assignPlayerToCell = playerNone
            }
            print()
            print()
            print()
            print("cell.player.term", cell.player.term)
            return assignPlayerToCell

        }
        
        func checkWhoWins() {
  
            let sumRow0 = cellR0C0.player.term + cellR0C1.player.term + cellR0C2.player.term
            let sumRow1 = cellR1C0.player.term + cellR1C1.player.term + cellR1C2.player.term
            let sumRow2 = cellR2C0.player.term + cellR2C1.player.term + cellR2C2.player.term
            let sumColumn0 = cellR0C0.player.term + cellR1C0.player.term + cellR2C0.player.term
            let sumColumn1 = cellR0C1.player.term + cellR1C1.player.term + cellR2C1.player.term
            let sumColumn2 = cellR0C2.player.term + cellR1C2.player.term + cellR2C2.player.term
            let sumDiagonal1 = cellR0C0.player.term + cellR1C1.player.term + cellR2C2.player.term
            let sumDiagonal2 = cellR2C0.player.term + cellR1C1.player.term + cellR0C2.player.term
            
            let termsRow0 = [cellR0C0.player.term, cellR0C1.player.term, cellR0C2.player.term]
            let termsRow1 = [cellR1C0.player.term, cellR1C1.player.term, cellR1C2.player.term]
            let termsRow2 = [cellR2C0.player.term, cellR2C1.player.term, cellR2C2.player.term]
            
            print()
            print()
            print("  ",termsRow0, " ", sumRow0)
            print("  ",termsRow1, " ", sumRow1)
            print("  ",termsRow2, " ", sumRow2)
            print()
            print(sumDiagonal2,",", sumColumn0,",", sumColumn1,",", sumColumn2, " ", sumDiagonal1)
            print("playerCountA = ",playerCountA, ", ", "playerCountB = ", playerCountB)

            if (sumRow0  == 3 || sumRow1 == 3 || sumRow2 == 3 || sumColumn0 == 3 || sumColumn1 == 3 || sumColumn2 == 3 || sumDiagonal1 == 3 || sumDiagonal2 == 3) {
                print("Player1 wins!")
            } else if (sumRow0  == 12 || sumRow1 == 12 || sumRow2 == 12 || sumColumn0 == 12 || sumColumn1 == 12 || sumColumn2 == 12 || sumDiagonal1 == 12 || sumDiagonal2 == 12) {
                print("Player2 wins!")
            } else {
                print("Next move!")
            }
            print("assignPlayerToCell.term ",assignPlayerToCell.term)
            print("turnPlayerA = ", turnPlayerA," turnPlayerB = ", turnPlayerB)
            print("curentPlayerTurn.term = ",curentPlayerTurn.term)
        }
    
    }
