//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Admin on 09.03.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var robotButton: UIButton!
    
    @IBOutlet weak var playLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isHidden = true
        resetButton.backgroundColor = .darkGray
        resetButton.layer.cornerRadius = 25
        
        
    }
    
    func play(_ sign: Sign){
    
    let robotSign = randomSign()
    robotButton.setTitle(robotSign.emoji, for: .normal)
    
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
            
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            
        }
        resetButton.isHidden = false
        
        let result = sign.takeTurn(robotSign)
        
        switch result {
        case .draw:
            playLabel.text = "It's a draw! Try again!"
        case .lose:
            playLabel.text = "You lose! It's a pitty!"
        case .win:
            playLabel.text = "You win! Congratulations!"
        case .start:
            playLabel.text = "Fix it!"
        }
    
    }
    
    //MARK: Create action button
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        
        play(.rock)
        
    }
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        
        play(.paper)
        
    }
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        
        play(.scissors)
        
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        robotButton.setTitle("🤖", for: .normal)
        playLabel.text = "Rock, paper, scissors?"
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        
    }
}

