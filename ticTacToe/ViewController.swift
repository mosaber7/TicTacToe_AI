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
    @IBOutlet weak var currentStateLabel: UILabel!
    
    var game = TicTacToe()
    var xScore: Int = 0
    var oScore: Int = 0
    var currentState: String = "X's turn"
    
    //array of the positions used in the game
    var gameButtonBoard: [UIButton] = []
    var gameboard:[player] = []
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        currentStateLabel.text = currentState
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
            //place the pic on the button -> uses the move fn to define wheather it is a x img or o img
            if game.validMove(sender.tag){
                sender.setBackgroundImage(UIImage(named: game.move(position: sender.tag)), for: .normal)
                gameButtonBoard.append(sender)
            }
            //checks if there is a wining scanario
            if game.isWin{
                // update the score and the wining text -> refrences passing
                game.updateScore(&xScore, &oScore, &currentState)
                //clear the game board
                clearGameBoard(board: gameButtonBoard)
                //updates the x score label
                xScoreLabel.text = String(xScore)
                //updates the o score label
                oScoreLabel.text = String(oScore)
                //update the current state label with 'X WON' || 'O WON'
                currentStateLabel.text = currentState
                
            }
            //checks for the draw situation
            else if game.isDraw{
                clearGameBoard(board: gameButtonBoard)
                currentStateLabel.text = "DRAW!!!!"
            }
            //defult situation where the two player still playing (no wining or draw situations)
            else{
                if currentStateLabel.text != nil{
                    currentStateLabel.text = "\(game.turn)'s turn"
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

