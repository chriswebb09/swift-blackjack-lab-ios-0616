//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    
//    var remainingCards: [String] {
//        return generateCards()
//    }
    var remainingCards: [String]
    var dealtCards: [String]
    
    init() {
        self.dealtCards = [String]()
        self.remainingCards = generateCards()
    }
    
    func generateCards() -> [String] {
        let getSuit: [String] = Card().validSuits()
        let getRanks: [String] = Card().validRanks()
        var newDeck: [String] = []
        for cardRank in getRanks {
            for cardSuit in getSuit {
                newDeck.append("/(cardSuit)/(cardRank)")
            }
        }
        return newDeck
    }
    
    func drawCard() -> String {
        let returnCard: String = self.remainingCards.popLast()!
        dealtCards.append(returnCard)
        return returnCard
    }
    
}
