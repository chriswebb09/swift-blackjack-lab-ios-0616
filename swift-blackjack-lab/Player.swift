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
    var aceInHand: Bool
    var wins: UInt
    var losses: UInt
    var handscore: UInt
    var blackjack: Bool
    var busted: Bool
    var stayed: Bool
    var mayHit: Bool
    var tokens: UInt
    var description: String
    
    init(name: String) {
        self.name = name
        self.cards = []
        self.aceInHand = false
        self.wins = 0
        self.losses = 0
        self.handscore = 0
        self.blackjack = false
        self.busted = false
        self.stayed = false
        self.mayHit = true
        self.tokens = 100
        self.description = "Player"
    }
    
    convenience init() {
        self.init(name: "Player")
        
    }
    
    func resetForNewGame() {
        cards.removeAll()
        handscore = 0
        aceInHand = false
        stayed = false
        busted = false
        blackjack = false
    }
    
//    func canPlaceBet(bet: UInt) -> Bool {
//        if (tokens >= bet) {
//            return true
//        }
//        return false
//    }
//    
//    func didWin(bet: UInt) -> Bool {
//        return false
//    }
//    
//    func didLose(bet: UInt) -> Bool {
//        return false
//    }
//    
    func acceptCard(card: Card) {
        cards.append(card)
        
    }
    
    func shouldHit() -> Bool {
        if handscore < 16 {
            stayed = true
            return false 
        }
        return true 
    }
    
    
}