//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
class Deck {
    
    private var remainingCards: [Card]
    private var dealtCards: [Card]
    var cardLabel: String
    var description: String
    
    init() {
        self.dealtCards = []
        self.remainingCards = Deck.generateDeck()
        self.cardLabel = Card().cardLabel
        self.description = Card().description
    }
    
    func drawCard() -> Card {
        let returnCard: Card = self.remainingCards.popLast()!
        dealtCards.append(returnCard)
        return returnCard
    }
    
    
    func shuffle() {
        
        var shuffledDeck = []
        
        while self.remainingCards.count > 0 {
            var index = arc4random_uniform(UInt32(self.remainingCards.count))
            var newCard = self.remainingCards.removeAtIndex(Int(index))
            shuffledDeck.arrayByAddingObject(newCard)
        }
        
        self.remainingCards.removeAll()
        //self.remainingCards.appendContents(shuffledDeck)
        
        
    }
    
    private class func generateDeck() -> [Card] {
        var cardDeck: [Card] = []
        for suit in Card().validSuits() {
            for rank in Card().validRanks() {
                cardDeck.append(Card(suit: suit, rank: rank))
            }
        }
        return cardDeck
    }
    
    
    func gatherDealtCards() {
        self.remainingCards.appendContentsOf(self.dealtCards)
    }
}
