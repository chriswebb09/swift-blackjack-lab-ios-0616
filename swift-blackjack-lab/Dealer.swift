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
    
    
    func dealCard() -> Card {
        let newCard = self.deck.drawCard()
        return newCard
    }
    
    func shuffleDeck() {
        self.deck.shuffle()
    }
    
}
