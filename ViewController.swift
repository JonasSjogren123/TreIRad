//
//  ViewController.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBoardBackground: UIImageView!
    
    @IBOutlet weak var playerAStatusView: UIButton!
    @IBOutlet weak var playerBStatusView: UIButton!
    
    @IBOutlet weak var cellViewR0C0: UIButton!
    @IBOutlet weak var cellViewR0C1: UIButton!
    @IBOutlet weak var cellViewR0C2: UIButton!
    @IBOutlet weak var cellViewR1C0: UIButton!
    @IBOutlet weak var cellViewR1C1: UIButton!
    @IBOutlet weak var cellViewR1C2: UIButton!
    @IBOutlet weak var cellViewR2C0: UIButton!
    @IBOutlet weak var cellViewR2C1: UIButton!
    @IBOutlet weak var cellViewR2C2: UIButton!
    
    var cellViews : [UIButton] = []
    var playerACellViews : [UIButton] = []
    var playerBCellViews : [UIButton] = []
    var playerOfDoomCellViews : [UIButton] = []
    
    var curentCellView : UIButton?
    var cellNumber : Int?
    var curentPlayer : Player?
    var cell : Cell?
    var curentCell : Cell?
    var playerAPoints : String = "00"
    var playerBPoints : String = "00"
    
    let board = Board()
        
    
    
    
    
    var cellColor : UIColor?

    let colorBoardBackground = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0,
                                             alpha: 0.1)
    var colorPlayerA = #colorLiteral(red: 0.0, green: 0.0, blue: 0.8,
                                     alpha: 0.7)
    var colorPlayerB =  #colorLiteral(red: 0.8, green: 0.8, blue: 0.0,
                                      alpha: 0.7)
    var colorPlayerNone = #colorLiteral(red: 0.1, green: 0.1, blue: 0.1,
                                        alpha: 1)
    var colorPlayerAWin = #colorLiteral(red: 0.3, green: 0.3, blue: 0.8,
                                     alpha: 1)
    var colorPlayerBWin =  #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                      alpha: 1)
    var colorPlayerOfDoomWin = #colorLiteral(red: 1.0, green: 0.0, blue: 0.0,
                                        alpha: 1)
    
    var turnPlayerA: Bool = true
    var turnPlayerB: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var playerACells : [Cell] = board.playerACells
        var playerBCells : [Cell] = board.playerBCells
        var playerOfDoomCells : [Cell] = board.playerOfDoomCells
      
        playerAPoints = String(board.playerAPoints)
        playerBPoints = String(board.playerBPoints)
        playerAStatusView.setTitle(playerAPoints, for: UIControl.State.normal)
        playerBStatusView.setTitle(playerBPoints, for: UIControl.State.normal)
        
        curentPlayer = self.board.playerA
        cellColor = colorPlayerNone
        
        cellViews = [cellViewR0C0, cellViewR0C1, cellViewR0C2, cellViewR1C0, cellViewR1C1, cellViewR1C2, cellViewR2C0, cellViewR2C1, cellViewR2C2]
        
        playerACellViews = []
        playerBCellViews = []
        playerOfDoomCellViews = []
        
        initializeCellViewColors()
        
    }
    
    func initializeCellViewColors() {
        playerAStatusView.backgroundColor = colorPlayerA
        playerBStatusView.backgroundColor = colorPlayerB

        for cellView in cellViews {
            cellView.backgroundColor = self.cellColor
        }
    }
    
    func assignCellViewColor(_ assignCellView : () -> UIButton?) {
        
        switch board.assignPlayerToCell {
        case board.playerA:
            if board.winningPlayer == board.playerA{
                self.colorPlayerA = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                                  alpha: 1)
                for cell in board.playerACells {
                    
                }
            } else {
                self.colorPlayerA = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                                  alpha: 0.5)}
            self.curentCellView?.backgroundColor = colorPlayerA
        case board.playerB:
            if board.winningPlayer == board.playerB{
                self.colorPlayerB = #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                                  alpha: 1)
            } else {
                self.colorPlayerB = #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                                  alpha: 0.5)}
            self.curentCellView?.backgroundColor = colorPlayerB
        default:
            if board.winningPlayer == board.playerOfDoom{
            self.colorPlayerOfDoomWin = #colorLiteral(red: 1.0, green: 0.0, blue: 0.0,
                                              alpha: 0.1)}
            else {
                self.curentCellView?.backgroundColor = colorPlayerNone
                
            }
        }
    }
    
    func assignCellView() -> UIButton? {
        
        let cellNumber = self.cellNumber
        
        switch cellNumber {
        case 1:
            curentCellView = cellViewR0C0
        case 2:
            curentCellView = cellViewR0C1
        case 3:
            curentCellView = cellViewR0C2
        case 4:
            curentCellView = cellViewR1C0
        case 5:
            curentCellView = cellViewR1C1
        case 6:
            curentCellView = cellViewR1C2
        case 7:
            curentCellView = cellViewR2C0
        case 8:
            curentCellView = cellViewR2C1
        default:
            curentCellView = cellViewR2C2
        }
        
        return curentCellView
        
        //print(board.gamePlay.cell.player.term)
        
    }
    
    /*func assignCellView() -> UIButton? {
        
        var curentCell = self.board.curentCell
        print("self.board.curentCell = ", self.board.curentCell?.name)

        switch curentCell {
        case self.board.cellR0C0:
            curentCellView = cellViewR0C0
            print("assignCellView case 1 " , 1)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR0C1:
            curentCellView = cellViewR0C1
            print("assignCellView case 2 " , 2)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR0C2:
            curentCellView = cellViewR0C2
            print("assignCellView case 3 " , 3)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR1C0:
            curentCellView = cellViewR1C0
            print("assignCellView case 4 " , 4)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR1C1:
            curentCellView = cellViewR1C1
            print("assignCellView case 5 " , 5)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR1C2:
            curentCellView = cellViewR1C2
            print("assignCellView case 6 " , 6)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR2C0:
            curentCellView = cellViewR2C0
            print("assignCellView case 7 " , 7)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        case self.board.cellR2C1:
            curentCellView = cellViewR2C1
            print("assignCellView case 8 " , 8)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        default:
            curentCellView = cellViewR2C2
            print("assignCellView case deault " , 9)
            print("self.board.curentCell = ", self.board.curentCell?.name)
            print("self.curentCell.name = ", self.curentCell?.name)
        }
        
        print("assignCellView()")
        print("assingCellView() cellView? ", curentCellView?.tag)
        print("self.board.curentCell = ", self.board.curentCell?.name)
        return curentCellView
    }*/
    
    func pairingCellsToCellViews() {
    for _ in board.playerACells {
        print("board.playerACells.indices =", board.playerACells.indices)
        //var indices : [Int] = board.playerACells.indices
        print("playerACellViews.indices = ", playerACellViews.indices)
        for cell in board.playerACells {print(cell.player.term)}
        for index in board.playerACells.indices {
            print("board.playerACells[index] = ", board.playerACells[index])
            playerACellViews.append(cellViews[index])
            print("playerACellViews[index] = ", playerACellViews[index])
        }
        //playerACellViews[index] = playerACellViews.append(<#UIButton#>)
    }
    }
    
    @IBAction func gameButtons(_ sender: UIButton) {
        
        pairingCellsToCellViews()
        if board.gameIsFinnished == true {
            board.resetGame()
            initializeCellViewColors()
        } else {
           // if self.board.singlePlayer == false || board.turnPlayerA {
                board.makeAMove(place: sender.tag)
                self.cellNumber = sender.tag
                assignCellView()
                assignCellViewColor({
                    assignCellView()
                })
            //} else {
               // board.autoMovePlayerB()
            //}
        }
        print("ViewController board.curentCell.name = ", board.curentCell?.name)
        print("ViewController curentCellView.tag", curentCellView?.tag)
    }
    
    @IBAction func playerAStatusButton(_ sender: UIButton) {
    }
    
    @IBAction func playerBStatusButton(_ sender: UIButton) {
    }
    
}

