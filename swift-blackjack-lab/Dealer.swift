//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck: Deck
    var bet: UInt
    var house: House
    var player: Player
    //var description: String
    
    
    init() {
        self.deck = Deck()
        self.player = Player()
        self.house = House()
        self.bet = 0
    }
    
    func deal() -> Card {
        return self.deck.drawCard()
    }
    
    
    func dealCard() -> Card {
        let newCard = self.deck.drawCard()
        return newCard
    }
    
    func shuffleDeck() {
        self.deck.shuffle()
    }
    
    func placeBet(bet: UInt) -> Bool {
        return false 
        
    }
    
    func award() -> String {
        return "Player Wins"
    }
    
    func turn(player: Player) {
        
    }
    
    func winner() -> String {
        return "No"
    }
    
}
