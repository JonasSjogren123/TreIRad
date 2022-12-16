//
//  ViewController.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBoardBackground: UIImageView!
    
    @IBOutlet weak var gameMode: UILabel!
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
    var colorPlayerAPlay = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                     alpha: 0.7)
    var colorPlayerBPlay =  #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                      alpha: 0.7)
    var colorPlayerNone = #colorLiteral(red: 0.1, green: 0.1, blue: 0.1,
                                        alpha: 1)
    var colorPlayerADim = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                        alpha: 0.2)
    var colorPlayerBDim = #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                        alpha: 0.2)
    var colorPlayerAAccent = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                     alpha: 1)
    var colorPlayerBAccent =  #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                      alpha: 1)
    var colorPlayerOfDoomAccent = #colorLiteral(red: 0.7, green: 0.1, blue: 0.3,
                                        alpha: 1)
    
    var turnPlayerA: Bool = true
    var turnPlayerB: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        playerAPoints = String(board.playerAPoints)
        playerBPoints = String(board.playerBPoints)
        playerAStatusView.setTitle(playerAPoints, for: UIControl.State.normal)
        playerBStatusView.setTitle(playerBPoints, for: UIControl.State.normal)
        
        board.turnPlayerA = true
        board.turnPlayerB = false
        
        curentPlayer = self.board.playerA
        cellColor = colorPlayerNone
        playerAStatusView.backgroundColor = colorPlayerAAccent
        playerBStatusView.backgroundColor = colorPlayerBPlay
        
        cellViews = [cellViewR0C0, cellViewR0C1, cellViewR0C2, cellViewR1C0, cellViewR1C1, cellViewR1C2, cellViewR2C0, cellViewR2C1, cellViewR2C2]
        
        playerACellViews = []
        playerBCellViews = []
        playerOfDoomCellViews = []
        
        initializeCellViewColors()
    }
    
    func updateViewContollerToBoard() {
        switch board.winningPlayer {
        case nil:
            for (index, cell) in board.allCells.enumerated() {
                switch cell.player {
                case board.playerA:
                    cellViews[index].backgroundColor = colorPlayerAPlay
                case board.playerB:
                    cellViews[index].backgroundColor = colorPlayerBPlay
                default: // board.playerOFDoom
                    cellViews[index].backgroundColor = colorPlayerNone
                }
            }
        case board.playerA:
            for (index, cell) in board.allCells.enumerated() {
                switch cell.player {
                case board.playerA:
                    cellViews[index].backgroundColor = colorPlayerAAccent
                case board.playerB:
                    cellViews[index].backgroundColor = colorPlayerBDim
                default: // board.playerOFDoom
                    cellViews[index].backgroundColor = colorPlayerNone
                }
            }
        case board.playerB:
            for (index, cell) in board.allCells.enumerated() {
                switch cell.player {
                case board.playerA:
                    cellViews[index].backgroundColor = colorPlayerADim
                case board.playerB:
                    cellViews[index].backgroundColor = colorPlayerBAccent
                default: // board.playerOFDoom
                    cellViews[index].backgroundColor = colorPlayerNone
                }
            }
        default: // board.playerOfDoom
            for (index, cell) in board.allCells.enumerated() {
                switch cell.player {
                case board.playerA:
                    cellViews[index].backgroundColor = colorPlayerADim
                case board.playerB:
                    cellViews[index].backgroundColor = colorPlayerBDim
                default: // board.playerOFDoom
                    cellViews[index].backgroundColor = colorPlayerOfDoomAccent
                }
            }
        }
    }
    
    func initializeCellViewColors() {
        let colorBoardBackground = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0,
                                                 alpha: 0.1)
        colorPlayerAPlay = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                         alpha: 0.7)
        colorPlayerBPlay =  #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                          alpha: 0.7)
        colorPlayerNone = #colorLiteral(red: 0.1, green: 0.1, blue: 0.1,
                                            alpha: 1)
        colorPlayerAAccent = #colorLiteral(red: 0.0, green: 0.0, blue: 1.0,
                                         alpha: 1)
        colorPlayerBAccent =  #colorLiteral(red: 1.0, green: 1.0, blue: 0.0,
                                          alpha: 1)
        colorPlayerOfDoomAccent = #colorLiteral(red: 1.0, green: 0.0, blue: 0.0,
                                            alpha: 1)
        playerAStatusView.backgroundColor = colorPlayerAPlay
        playerBStatusView.backgroundColor = colorPlayerBPlay

        for cellView in cellViews {
            cellView.backgroundColor = self.cellColor
        }
    }
    
    func assignCellView() -> UIButton? {
        
        let curentCell = self.board.curentCell

        switch curentCell {
        case self.board.cellR0C0:
            curentCellView = cellViewR0C0
        case self.board.cellR0C1:
            curentCellView = cellViewR0C1
        case self.board.cellR0C2:
            curentCellView = cellViewR0C2
        case self.board.cellR1C0:
            curentCellView = cellViewR1C0
        case self.board.cellR1C1:
            curentCellView = cellViewR1C1
        case self.board.cellR1C2:
            curentCellView = cellViewR1C2
        case self.board.cellR2C0:
            curentCellView = cellViewR2C0
        case self.board.cellR2C1:
            curentCellView = cellViewR2C1
        default:
            curentCellView = cellViewR2C2
        }
        return curentCellView
    }
    
    func handleExtraOutlets() {
        if board.singlePlayer == true {
            board.singlePlayer = false
            gameMode.isHidden = true
        } else {board.singlePlayer = true
            gameMode.isHidden = false
        }
    }
    
    @IBAction func gameButtons(_ sender: UIButton) {
        if board.gameIsFinnished == true {
            board.resetGame()
            initializeCellViewColors()
            updateViewContollerToBoard()
        } else {
                board.makeAMove(place: sender.tag)
                self.cellNumber = sender.tag
                assignCellView()
        }
        updateViewContollerToBoard()
    }
    
    @IBAction func playerAStatusButton(_ sender: UIButton) {
        
    }
    
    @IBAction func playerBStatusButton(_ sender: UIButton) {
        handleExtraOutlets()
    }
    
}
 
