//
//  ViewController.swift
//  ticTacToe
//
//  Created by Saber on 18/01/2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var xScoreLabel: UILabel!
    @IBOutlet weak var oScoreLabel: UILabel!
    @IBOutlet weak var winingLabel: UILabel!
    var xScore: Int = 0
    var oScore: Int = 0
    var winingText = ""
    var gameBoard: [UIButton] = []
    
    var game = TicTacToe()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if game.validMove(sender.tag){
            sender.setBackgroundImage(UIImage(named: game.move(position: sender.tag)), for: .normal)
            gameBoard.append(sender)
        }
        if game.isWin{
            game.updateScore(&xScore, &oScore, &winingText)
            clearGameBoard(board: gameBoard)
            xScoreLabel.text = String(xScore)
            oScoreLabel.text = String(oScore)
            winingLabel.text = winingText
            
        }
        else if game.isDraw{
            clearGameBoard(board: gameBoard)
            winingLabel.text = "DRAW!!!!"
        }
        else{
            if winingLabel.text != nil, !winingLabel.text!.isEmpty{
                winingLabel.text = ""
            }
        }
        
    }
    func clearGameBoard(board array: [UIButton]){
        game =  TicTacToe()
        for button in array{
            button.setBackgroundImage(nil, for: .normal)
        }
    }
    
    
}

