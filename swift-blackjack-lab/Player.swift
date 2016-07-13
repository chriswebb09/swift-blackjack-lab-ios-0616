//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card]
    var handscore: UInt
    var blackjack: Bool
    var busted: Bool
    var stayed: Bool
    var mayHit: Bool
    var tokens: UInt
    var description: String
    
    init(name: String) {
        self.name = name
        self.cards = [Card()]
        self.handscore = 0
        self.blackjack = false
        self.busted = false
        self.stayed = false
        self.mayHit = true
        self.tokens = 100
        self.description = "Game"
    }
    
    convenience init() {
        self.init(name: "Player")
        
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return false
    }
    
    func didWin(bet: UInt) -> Bool {
        return false
    }
    
    func didLose(bet: UInt) -> Bool {
        return false
    }
    
    
}