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
    var cardLabel: String {
        return "\(suit)\(rank)"
    }
    var cardValue: UInt? {
        get {
            return getRankValue()
        }
        
        set(newRank) {
            self.rank = String(newRank)
        }
    }
    var description: String {
        return "Card: \(self.cardLabel) Value: \(self.cardValue)"
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        //        self.cardLabel = "\(suit)\(rank)"
        //        self.cardValue = UInt(rank)
        //self.description =
    }
    
    convenience init () {
        self.init(suit:"!", rank:"N")
    }
    
    func validSuits() -> [String] {
        let suitsArray: [String] = ["♥", "♣", "♦", "♠"]
        return suitsArray
    }
    
    func validRanks() -> [String] {
        let ranksArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]
        return ranksArray
    }
    
    
    func getRankValue() -> UInt {
        var returnRank: UInt = 0
        let numRanks = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        if self.rank == "Q" || rank == "J" || rank == "K" {
            returnRank = 10
        } else if self.rank == "A" {
            returnRank == 11
        } else if numRanks.contains(self.rank) {
            returnRank = UInt(self.rank)!
        }
        return returnRank
    }
    
}

