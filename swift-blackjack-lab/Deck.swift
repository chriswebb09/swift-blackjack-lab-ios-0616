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
    var cardLabel: String {
        return Card().cardLabel
    }
    var description: String
    
    init() {
        self.dealtCards = []
        self.remainingCards = Deck.generateDeck()
        //self.cardLabel = Card().cardLabel
        self.description = Card().description
    }
    
    func drawCard() -> Card {
        if self.remainingCards.count > 0 {
            let returnCard: Card = self.remainingCards.popLast()!
            self.dealtCards.append(returnCard)
            return returnCard
        } else {
            self.gatherDealtCards()
            let returnCard: Card = self.remainingCards.popLast()!
            self.dealtCards.append(returnCard)
            return returnCard
        }
        
    }
    
    
    func shuffle() {
        var shuffledDeck: [Card] = self.remainingCards
        var newDeck: [Card] = []
        while shuffledDeck.count > 0 {
            let i = arc4random_uniform(UInt32(shuffledDeck.count))
            let randomCard: Card = shuffledDeck[Int(i)]
            newDeck.append(randomCard)
            shuffledDeck.removeAtIndex(Int(i))
            
        }
        self.remainingCards = newDeck
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
        print("Gather dealt cards: \(self.remainingCards)")
        self.dealtCards.removeAll()
    }
}
