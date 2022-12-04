//
//  ViewController.swift
//  TreIRad
//
//  Created by Jonas Sjögren on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var viewR0C0: UIButton!
    @IBOutlet weak var viewR0C1: UIButton!
    @IBOutlet weak var viewR0C2: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameLogicTest02 = Board()
        
        gameLogicTest02.makeAMove()
        
    }

    @IBAction func buttonR0C0(_ sender: UIButton) {
        viewR0C0.backgroundColor = #colorLiteral(red: 0.4392156899,
                                                 green: 0.61176470611,
                                                 blue: 0.1921568662,
                                                 alpha: 1)
    }
    
    @IBAction func buttonR0C1(_ sender: UIButton) {
        viewR0C1.backgroundColor = #colorLiteral(red: 0.4392156899,
                                                 green: 0.01176470611,
                                                 blue: 0.8921568662,
                                                 alpha: 1)
    }
    
    @IBAction func buttonR0C2(_ sender: UIButton) {
        viewR0C2.backgroundColor = #colorLiteral(red: 0.8392156899,
                                                 green: 0.01176470611,
                                                 blue: 0.1921568662,
                                                 alpha: 1)
    }
    
    
}

