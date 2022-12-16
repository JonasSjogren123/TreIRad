//
//  File.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import Foundation

class Board {
    
    var singlePlayer : Bool = true
    var gameIsFinnished : Bool = false
    let playerOfDoom = Player(symbol: "_", term: 0, name: "Doom")
    let playerA = Player(symbol: "O", term: 1, name: "A")
    let playerB = Player(symbol: "X", term: 4, name: "B" )
    var winningPlayer : Player?
    var turnPlayerA: Bool = true
    var turnPlayerB: Bool = false
    var curentPlayerTurn : Player
    var assignPlayerToCell : Player
    var playerAPoints = 0
    var playerBPoints = 0
    var curentCell : Cell?
    var row0 : [Cell]
    var row1 : [Cell]
    var row2 : [Cell]
    var column0 : [Cell]
    var column1 : [Cell]
    var column2 : [Cell]
    var diagonal1 : [Cell]
    var diagonal2 : [Cell]
    var allCells : [Cell]
    var completeBoard : [[Cell]]
    var sequenceOfCompleteBoards : [[[Cell]]]
    var playerOfDoomCells : [Cell]
    var playerACells : [Cell]
    var playerBCells : [Cell]
    let cellGroups : [[Cell]]
    
    var cellR0C0, cellR0C1, cellR0C2, cellR1C0, cellR1C1, cellR1C2, cellR2C0, cellR2C1, cellR2C2 : Cell
    
    init() {
        self.cellR0C0 = Cell(name: "cellR0C0", player: playerOfDoom)
        self.cellR0C1 = Cell(name: "cellR0C1", player: playerOfDoom)
        self.cellR0C2 = Cell(name: "cellR0C2", player: playerOfDoom)
        self.cellR1C0 = Cell(name: "cellR1C0", player: playerOfDoom)
        self.cellR1C1 = Cell(name: "cellR1C1", player: playerOfDoom)
        self.cellR1C2 = Cell(name: "cellR1C2", player: playerOfDoom)
        self.cellR2C0 = Cell(name: "cellR2C0", player: playerOfDoom)
        self.cellR2C1 = Cell(name: "cellR2C1", player: playerOfDoom)
        self.cellR2C2 = Cell(name: "cellR2C2", player: playerOfDoom)
        
        row0 = [cellR0C0, cellR0C1, cellR0C2]
        row1 = [cellR1C0, cellR1C1, cellR1C2]
        row2 = [cellR2C0, cellR2C1, cellR2C2]
        column0 = [row0[0], row1[0], row2[0]]
        column1 = [row0[1], row1[1], row2[1]]
        column2 = [row0[2], row1[2], row2[2]]
        diagonal1 = [row0[0], row1[1], row2[2]]
        diagonal2 = [row0[2], row1[1], row2[0]]
        
        cellGroups = [row0, row1, row2, column0, column1, column2, diagonal1, diagonal2]
        
        allCells = [row0[0], row0[1], row0[2], row1[0], row1[1], row1[2], row2[0], row2[1], row2[2]]
        
        completeBoard = [row0, row1, row2]
        sequenceOfCompleteBoards = []
        playerACells = []
        playerBCells = []
        playerOfDoomCells = [cellR0C0, cellR0C1, cellR0C2, cellR1C0, cellR1C1, cellR1C2, cellR2C0, cellR2C1, cellR2C2]
        
        curentPlayerTurn = playerA
        assignPlayerToCell = playerOfDoom
        winningPlayer = nil
        curentCell = nil
    }

    func makeAMove(place: Int) -> Cell? {
        var cell : Cell? = nil
        if singlePlayer == false || turnPlayerA {
            var cellNumber = place
        
            switch place {
            case 1:
                gamePlay(cellR0C0)
                cell = cellR0C0
                curentCell = cellR0C0
                cellNumber = 1
            case 2:
                gamePlay(cellR0C1)
                cell = cellR0C1
                curentCell = cellR0C1
                cellNumber = 2
            case 3:
                gamePlay(cellR0C2)
                cell = cellR0C2
                curentCell = cellR0C2
                cellNumber = 3
            case 4:
                gamePlay(cellR1C0)
                cell = cellR1C0
                curentCell = cellR1C0
                cellNumber = 4
            case 5:
                gamePlay(cellR1C1)
                cell = cellR1C1
                curentCell = cellR1C1
                cellNumber = 5
            case 6:
                gamePlay(cellR1C2)
                cell = cellR1C2
                curentCell = cellR1C2
                cellNumber = 6
            case 7:
                gamePlay(cellR2C0)
                cell = cellR2C0
                curentCell = cellR2C0
                cellNumber = 7
            case 8:
                gamePlay(cellR2C1)
                cell = cellR2C1
                curentCell = cellR2C1
                cellNumber = 8
            default:
                gamePlay(cellR2C2)
                cell = cellR2C2
                curentCell = cellR2C2
                cellNumber = 9
            }
        } else if singlePlayer == true && turnPlayerB == true {
            autoMovePlayerB()
            curentCell = autoMovePlayerB()
            cell = autoMovePlayerB()
        }
        saveCompleteBoard()
        checkWhoWins()
        return cell
    }
    
    func autoMovePlayerB() -> Cell {
        var cell : Cell?
        var index = 0
        if turnPlayerB {
            if playerBCells.count < 3 {
                index = Int.random(in: 0...((playerOfDoomCells.count)-1))
                gamePlay(playerOfDoomCells[index])
                if index >= playerOfDoomCells.count {index -= 1}
                cell = playerOfDoomCells[index]
            } else if playerBCells.count > 2 {
                index = Int.random(in: 0...(playerBCells.count-1))
                if index >= playerBCells.count {index -= 1}
                gamePlay(playerBCells[index])
                if index >= playerBCells.count {index -= 1}
                cell = playerBCells[index]
            }
        }
        return cell ?? cellR0C0
    }
        
        func gamePlay (_ cell : Cell) -> Player{
            let cell = cell
            if cell.player == self.playerOfDoom {
                if turnPlayerA && playerACells.count < 3 {
                    cell.player = playerA
                    playerACells.append(cell)
                    playerOfDoomCells = playerOfDoomCells.filter { $0 != cell }
                    turnPlayerA = false
                    turnPlayerB = true
                    self.curentPlayerTurn = playerB
                } else if turnPlayerB && playerBCells.count < 3 {
                    cell.player = playerB
                    playerBCells.append(cell)
                    playerOfDoomCells = playerOfDoomCells.filter { $0 != cell }
                    turnPlayerA = true
                    turnPlayerB = false
                    self.curentPlayerTurn = playerA
                }
            } else if cell.player == self.playerA {
                if (turnPlayerA == true) && playerACells.count > 2 {
                    cell.player = playerOfDoom
                    playerACells = playerACells.filter { $0 != cell }
                    playerOfDoomCells.append(cell)
                    turnPlayerA = true
                    turnPlayerB = false
                    self.curentPlayerTurn = playerA
                } else {}
            } else if cell.player == self.playerB {
                if (turnPlayerB == true) && playerBCells.count > 2 {
                    cell.player = playerOfDoom
                    playerBCells = playerBCells.filter { $0 != cell }
                    print("After playerBCells = playerBCells.filter { $0 != cell }")
                    print("playerBCells.count = ",playerBCells.count)
                    print("playerBCells index = ",playerBCells.indices)
                    playerOfDoomCells.append(cell)
                    turnPlayerA = false
                    turnPlayerB = true
                    self.curentPlayerTurn = playerB
                } else {}
            }
            print()
            print()
            print("function gamePlay cell.player = ",cell.player.term, cell.player.name)
            print("playerACells.count = ", playerACells.count)
            playerACells.forEach {print($0)}
            print("playerBCells.count = ",playerBCells.count)
            playerBCells.forEach {print($0)}
            print("playerOfDoomCells.count = ",playerOfDoomCells.count)
            playerOfDoomCells.forEach {print($0)}

            switch cell.player {
            case playerA:
                assignPlayerToCell = playerA
            case playerB:
                assignPlayerToCell = playerB
            default:
                assignPlayerToCell = playerOfDoom
            }
            return assignPlayerToCell
        }
    
    func saveCompleteBoard () {
        sequenceOfCompleteBoards.append(completeBoard)
        print("completeBoard",completeBoard)
        for row in completeBoard {
            print()
            for cell in row {
                print(cell.player.term, cell.player.name)
            }
        }
    }
    
    func replaySequenceOfCompleteBoards() {
        for completeBoard in sequenceOfCompleteBoards {
            print()
            print()
            for row in completeBoard {
                print()
                for cell in row {
                print(cell.player.term)
                }
            }
        }
    }
    
    func doWinningStuff(player: Player) {
        print("player",player.name, "wins!!!!!")
        gameIsFinnished = true
        replaySequenceOfCompleteBoards()
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
            print("playerCountA = ",playerACells.count, ", ", "playerCountB = ", playerBCells.count)

            
                    if (sumRow0  == 3 || sumRow1 == 3 || sumRow2 == 3 || sumColumn0 == 3 || sumColumn1 == 3 || sumColumn2 == 3 || sumDiagonal1 == 3 || sumDiagonal2 == 3) {
                        winningPlayer = playerA
                        playerAPoints += 1
                        doWinningStuff(player: winningPlayer ?? playerOfDoom)
                        print("PlayerA wins!")
                    } else if (sumRow0  == 12 || sumRow1 == 12 || sumRow2 == 12 || sumColumn0 == 12 || sumColumn1 == 12 || sumColumn2 == 12 || sumDiagonal1 == 12 || sumDiagonal2 == 12) {
                        winningPlayer = playerB
                        playerBPoints += 1
                        doWinningStuff(player: winningPlayer ?? playerOfDoom)
                        print("PlayerB wins!")
                    }
                    else if ((playerACells.count > 2 && playerBCells.count > 2) && ((sumRow0  == 00 || sumRow1 == 00 || sumRow2 == 00 || sumColumn0 == 00 || sumColumn1 == 00 || sumColumn2 == 00 || sumDiagonal1 == 00 || sumDiagonal2 == 00))) {
                        winningPlayer = playerOfDoom
                        playerAPoints = 0
                        playerBPoints = 0
                        doWinningStuff(player: winningPlayer ?? playerOfDoom)
                        print("PlayerofDoom wins!")
                    }
             else {
                print("Next move!")
            }
            print("assignPlayerToCell.term ",assignPlayerToCell.term)
            print("turnPlayerA = ", turnPlayerA," turnPlayerB = ", turnPlayerB)
            print("curentPlayerTurn.term = ",curentPlayerTurn.term)
            print("playerAPoints = ", playerAPoints)
            print("playerBPoints = ", playerBPoints)
            
        }
    
    func resetGame() {
        if gameIsFinnished {
            
            self.cellR0C0 = Cell(name: "cellR0C0", player: playerOfDoom)
            self.cellR0C1 = Cell(name: "cellR0C1", player: playerOfDoom)
            self.cellR0C2 = Cell(name: "cellR0C2", player: playerOfDoom)
            self.cellR1C0 = Cell(name: "cellR1C0", player: playerOfDoom)
            self.cellR1C1 = Cell(name: "cellR1C1", player: playerOfDoom)
            self.cellR1C2 = Cell(name: "cellR1C2", player: playerOfDoom)
            self.cellR2C0 = Cell(name: "cellR2C0", player: playerOfDoom)
            self.cellR2C1 = Cell(name: "cellR2C1", player: playerOfDoom)
            self.cellR2C2 = Cell(name: "cellR2C2", player: playerOfDoom)
            
            row0 = [cellR0C0, cellR0C1, cellR0C2]
            row1 = [cellR1C0, cellR1C1, cellR1C2]
            row2 = [cellR2C0, cellR2C1, cellR2C2]
            column0 = [row0[0], row1[0], row2[0]]
            column1 = [row0[1], row1[1], row2[1]]
            column2 = [row0[2], row1[2], row2[2]]
            diagonal1 = [row0[0], row1[1], row2[2]]
            diagonal2 = [row0[2], row1[1], row2[0]]
            
            completeBoard = [row0, row1, row2]
            sequenceOfCompleteBoards = []
            playerACells = []
            playerBCells = []
            playerOfDoomCells = [cellR0C0, cellR0C1, cellR0C2, cellR1C0, cellR1C1, cellR1C2, cellR2C0, cellR2C1, cellR2C2]
            
            for cell in allCells {
                cell.player = playerOfDoom
            }
            
            allCells = [row0[0], row0[1], row0[2], row1[0], row1[1], row1[2], row2[0], row2[1], row2[2]]

            
            curentPlayerTurn = playerA
            assignPlayerToCell = playerOfDoom
            winningPlayer = nil
            
            turnPlayerA = true
            
            gameIsFinnished = false
            
        }
    }
    
    }
