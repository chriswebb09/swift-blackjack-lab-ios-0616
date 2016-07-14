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
    var house: House
    var player: Player
    
    
    init() {
        self.deck = Deck()
        self.house = House()
        self.player = Player()
    }
    
//    func placeBet(bet: UInt) {
//        
//    }
    
//    func turn(player: Player) {
//        
//    }
//    
//    func winner() -> String{
//        return "House"
//        
//    }
    
    func dealRound() {
        while player.cards.count < 2 {
            let newCard = self.deck.drawCard()
            player.acceptCard(newCard)
        }
    }
    
    func dealCardToPlayer() {
        let newCard = self.deck.drawCard()
        self.player.acceptCard(newCard)
    }
    
//    func bet() {
//        
//    }
//    
    func award() {
        
    }
    
    
    
    
}
