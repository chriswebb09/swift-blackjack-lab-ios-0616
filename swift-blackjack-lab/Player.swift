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
    var handScore: UInt
    var blackjack: Bool
    var busted: Bool
    var stayed: Bool
    var mayHit: Bool
    var tokens: UInt
    var description: String
    
    init(name: String, cards: [Card]) {
        self.name = name
        self.cards = cards
        self.handScore = 0
        self.blackjack = false
        self.busted = false
        self.stayed = false
        self.mayHit = true
        self.tokens = 100
        self.description = "Game"
    }
    
    convenience init(name: String) {
        self.init(name: "Player", cards: [Card()])
    }
}