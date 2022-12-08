//
//  ViewController.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBoardBackground: UIImageView!
    
    @IBOutlet weak var viewR0C0: UIButton!
    @IBOutlet weak var viewR0C1: UIButton!
    @IBOutlet weak var viewR0C2: UIButton!
    @IBOutlet weak var viewR1C0: UIButton!
    @IBOutlet weak var viewR1C1: UIButton!
    @IBOutlet weak var viewR1C2: UIButton!
    @IBOutlet weak var viewR2C0: UIButton!
    @IBOutlet weak var viewR2C1: UIButton!
    @IBOutlet weak var viewR2C2: UIButton!
    
    
    let board = Board()
    //var cell : Cell
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
  //  var cellColor : UIColor
    
    let colorBoardBackground = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0,
                                             alpha: 0.1)
    let colorPlayerA = #colorLiteral(red: 0.4392156899, green: 0.61176470611, blue: 0.1921568662,
                                     alpha: 1)
    let colorPlayerB =  #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.8921568662,
                                      alpha: 1)
    let colorPlayerNone = #colorLiteral(red: 0.8392156899, green: 0.01176470611, blue: 0.1921568662,
                                        alpha: 1)
    
    var turnPlayerA: Bool = true
    var turnPlayerB: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let gameLogicTest02 = Board()
        
        //gameLogicTest02.makeAMove()
        
        //viewBoardBackground.backgroundColor = colorBoardBackground
    }
    
    /*func playerTurn () {
     
     if turnPlayerA {
     turnPlayerA = false
     turnPlayerB = true
     } else {
     turnPlayerA = true
     turnPlayerB = false
     }
     
     }
     */
    /*
     func claimCell () {
     let playerNone = 0
     let playerA = 1
     let playerB = 2
     let cellPlayer = playerNone
     
     switch cellPlayer {
     case playerA:
     case playerB:
     default:
     }
     if (cellPlayer == playerNone) {}
     if (cellPlayer == playerA) {}
     if (cellPlayer == playerB) {}
     }
     */
    
    var passPositionToBoard : String?
    
    func assignColor() {
//        switch board.togglePlayerTurn(cell.player.symbol) {
//        case playerA.symbol:
//            cellColor = colorPlayerA
//        case playerB.symbol:
//            cellColor = colorPlayerB
//        default:
//            cellColor = colorPlayerNone
//        }
    }
    
    func assignCell(cell: Cell) -> Cell{
        let cell = cell
        return cell
    }
    
   // @IBAction func buttonR0C0(_ sender: UIButton) {
        //        viewR0C0.backgroundColor = colorPlayerA
        //        if board.togglePlayerTurn(board.cellR0C0.board.playerA.symbol, ) == board.playerA.symbol {
        //            viewR0C0.backgroundColor = colorPlayerA
        //        } else if board.togglePlayerTurn(board.cellR0C0,board.playerB) == board.playerB.symbol {
        //            viewR0C0.backgroundColor = colorPlayerB
    //}
    
    @IBAction func buttonR0C1(_ sender: UIButton) {
        viewR0C1.backgroundColor = colorPlayerB
        board.makeAMove(place: sender.tag)
       // assignColor()
        
    }
    
    
}

