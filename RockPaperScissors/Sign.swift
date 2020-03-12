//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Admin on 09.03.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    
    let sign = randomChoice.nextInt()
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
    
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        
        switch self {
        case .paper:
            return "✋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    
    func takeTurn (_ opposite: Sign) -> GameState {
        
        switch (self, opposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.scissors, .paper),
             (.paper, .rock):
            return .win
        default:
            return .lose
        }
        
    }
    
}



