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
    
    var cellView : UIButton?
    
    var cellNumber : Int?
    
    
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

    }
    
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
    
    func assignCellView(){
        
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
        
        board.makeAMove(place: sender.tag)
        self.cellNumber = sender.tag
        assignCellView()
        self.cellView?.backgroundColor = colorPlayerB
       // assignColor()
        
    }
    
    
}

