//
//  ticTacToe.swift
//  ticTacToe
//
//  Created by Saber on 18/01/2021.
//

import Foundation

enum player{
    case X
    case O
    case E //Empty
    
    var opposite: player{
        switch self {
        case .X:
            return .O
        case .O:
            return .X
        default:
            return .E //Empty
        }
    }
}

struct TicTacToe {
    
   
    var positions: [player]
    var turn : player
    
    
    var isWin: Bool{
        return
            // all zero wining cases
            positions[0] == positions[1] && positions[0] == positions[2] && positions[0] != .E ||
            positions[0] == positions[3] && positions[0] == positions[6] && positions[0] != .E ||
            positions[0] == positions[4] && positions[0] == positions[8] && positions[0] != .E ||
            positions[1] == positions[4] && positions[1] == positions[7] && positions[1] != .E ||
            
            positions[2] == positions[5] && positions[2] == positions[8] && positions[2] != .E ||
            positions[2] == positions[4] && positions[2] == positions[6] && positions[2] != .E ||
            
            positions[3] == positions[4] && positions[3] == positions[5] && positions[3] != .E ||
            
            positions[6] == positions[7] && positions[6] == positions[8] && positions[6] != .E
        
    }
    var isDraw: Bool{
        if positions.contains(.E){
            return false
        }
        return true
    }
    
    init() {
        self.positions = [.E, .E, .E,
                          .E, .E, .E,
                          .E, .E, .E]
        
        // X begins the game
        self.turn = player.X
    }
    
    func updateScore(_ xScore: inout Int,_ oScore: inout Int, _ wining: inout String){
        switch turn {
        case .X:
            oScore += 1
            wining = "O WON!!!"
        case.O:
            xScore += 1
            wining = "X WON!!!"
        default:
            break
        }
     }
    
    mutating func move(position: Int) -> String{
        switch turn {
        case .X:
            positions[position] = .X
            turn = turn.opposite
            return "X.png"
        case .O:
            positions[position] = .O
            turn = turn.opposite
            return"O.png"
        default:
            return ""
            
        }
    }
    func validMove(_ position: Int)-> Bool{
        if positions[position] == .E{return true}
        return false
        
    }
    
    
}
