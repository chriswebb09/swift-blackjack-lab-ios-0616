//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt?
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "/(suit)/(rank)"
        self.cardValue = UInt(rank)
    }
    
    convenience init () {
        self.init(suit:"!", rank:"N")
    }
    
    func validSuits() -> [String] {
        let suitsArray: [String] = ["♥", "♣", "♦", "♠"]
        return suitsArray
    }
    
    func validRanks() -> [String] {
        let ranksArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return ranksArray
    }
    
    
}
