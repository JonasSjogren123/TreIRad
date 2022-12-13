//
//  ViewController.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBoardBackground: UIImageView!
    
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
    
    var cellView : UIButton?
    var cellNumber : Int?
    var curentPlayer : Player?
    
    let board = Board()
        
    var cell : Cell?
    
    
    
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
        var playerOfDoomCells  : [Cell] = board.playerOfDoomCells
        
        curentPlayer = self.board.playerA
        cellColor = colorPlayerNone
        cellViews = [cellViewR0C0, cellViewR0C1, cellViewR0C2, cellViewR1C0, cellViewR1C1, cellViewR1C2, cellViewR2C0, cellViewR2C1, cellViewR2C2]
        
        initializeCellViewColors()
        
    }
    
    func initializeCellViewColors() {
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
            self.cellView?.backgroundColor = colorPlayerA
        case board.playerB:
            if board.winningPlayer == board.playerB{
                self.colorPlayerB = #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                                  alpha: 1)
            } else {
                self.colorPlayerB = #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                                  alpha: 0.5)}
            self.cellView?.backgroundColor = colorPlayerB
        default:
            if board.winningPlayer == board.playerOfDoom{
            self.colorPlayerOfDoomWin = #colorLiteral(red: 1.0, green: 0.0, blue: 0.0,
                                              alpha: 0.1)}
            else {
                self.cellView?.backgroundColor = colorPlayerNone
                
            }
        }
    }
    
    func assignCellView() -> UIButton? {
        
        let cellNumber = self.cellNumber
        
        switch cellNumber {
        case 1:
            cellView = cellViewR0C0
        case 2:
            cellView = cellViewR0C1
        case 3:
            cellView = cellViewR0C2
        case 4:
            cellView = cellViewR1C0
        case 5:
            cellView = cellViewR1C1
        case 6:
            cellView = cellViewR1C2
        case 7:
            cellView = cellViewR2C0
        case 8:
            cellView = cellViewR2C1
        default:
            cellView = cellViewR2C2
        }
        
        return cellView
        
        //print(board.gamePlay.cell.player.term)
        
    }

    /*func assignCellView() -> UIButton {
        
        //var cellNumber = board.makeAMove(place:)
        
        let cellNumber = 7
        
        switch cellNumber {
        case 1:
            return cellViewR0C0
        case 2:
            return cellViewR0C1
        case 3:
            return cellViewR0C2
        case 4:
            return cellViewR1C0
        case 5:
            return cellViewR1C1
        case 6:
            return cellViewR1C2
        case 7:
            return cellViewR2C0
        case 8:
            return cellViewR2C1
        default:
            return cellViewR2C2
        }
    }
 */
    
    @IBAction func gameButtons(_ sender: UIButton) {
        if board.gameIsFinnished == true {
            board.resetGame()
            initializeCellViewColors()
        } else {
            if self.board.singlePlayer == false || board.turnPlayerA {
                board.makeAMove(place: sender.tag)
                self.cellNumber = sender.tag
                assignCellView()
                assignCellViewColor({
                    assignCellView()
                })
            } else {
                board.autoMovePlayerB()
            }
        }
    }
    
}

