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
    
    
    init() {
        self.deck = Deck()
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
    
//    func dealRound() {
//        while player.cards.count < 2 {
//            let newCard = self.deck.drawCard()
//            player.acceptCard(newCard)
//        }
//    }
    
    
    func dealCard() -> Card {
        let newCard = self.deck.drawCard()
        return newCard
    }
    
//    func dealCardToPlayer() {
//        let newCard = self.deck.drawCard()
//        self.player.acceptCard(newCard)
//    }
//    
//    func dealCardToHouse() {
//        let newCard = self.deck.drawCard()
//        self.house.acceptCard(newCard)
//    }
    
//    func bet() {
//        
//    }
//    
    func award() {
        
    }
    
    
    
    
}
