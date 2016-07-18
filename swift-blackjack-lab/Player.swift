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
    var aceInHand: Bool {
        return checkForAce()
    }
    var wins: UInt
    var numberOfAces: UInt
    var losses: UInt
    var turn: Bool
    var won: Bool
    var handscore: UInt {
        return getScore()
    }
    var blackjack: Bool {
        if self.handscore == 21 {
            return true
        } else {
            return false
        }
    }
    var busted: Bool {
        if self.handscore > 21 {
            return true
        } else {
            return false
        }
    }
    var stayed: Bool
    var mayHit: Bool {
        if self.handscore > 21 && !self.stayed {
            return true
        } else {
            return false
        }
    }
    var description: String
    
    init(name: String) {
        self.name = name
        self.cards = []
        //self.aceInHand = false
        self.wins = 0
        self.losses = 0
        self.turn = false
        self.description = "Player"
        self.stayed = false
        self.won = false
        self.numberOfAces = 0
    }
    
    convenience init() {
        self.init(name: "Player")
    }
    
    func getScore() -> UInt {
        var cardValue: UInt = 0
        for card in self.cards {
            if card.cardLabel.containsString("A") && self.aceInHand {
                cardValue += 11
            } else {
                cardValue += card.cardValue!
            }
        }
        return cardValue
    }
    
    func resetForNewGame() {
        self.cards.removeAll()
        self.handscore
        self.stayed = false
    }
    
    func checkPlayerStatus() {
        var cardString: String
        if self.handscore > 21 {
            self.turn = false
            print("\(name) Turn ")
            print("busted")
            print("\(name) \(name)")
            print("BUSTED \(cards)")
            for card in cards {
                cardString = card.cardLabel
                self.description.stringByAppendingString("Card String Description \(cardString)")
                print("\(cardString)")
                print("\(card.cardLabel)")
                print(description)
            }
        }
        if self.handscore == 21 {
            print("blackjack")
            self.turn = false
            self.blackjack
            print("\(name) Turn ")
            print("\(name) \(cards)")
            print("Blackjack \(name)")
        }
        if self.handscore < 21 {
            print("\(name) \(cards)")
            print("Less than 21: \(name)")
            print("go")
        }
        
    }
    
    func checkForAce() -> Bool {
        for card in self.cards {
            if card.cardLabel.containsString("A") {
                self.numberOfAces += 1
            }
            
        }
        if self.numberOfAces > 0 {
            return true
        }
        return false
    }
    
    //    func checkStatus() {
    //        if self.handscore > 21 {
    //            self.busted = true
    //            self.blackjack = false
    //        } else if self.handscore < 21 {
    //            self.busted = false
    //            self.blackjack = false
    //        } else if self.handscore == 21 {
    //            self.blackjack = true
    //        }
    //    }
    //
    func acceptCard(card: Card) {
        self.cards.append(card)
    }
    
    
    func shouldHit() -> Bool {
        if self.handscore >= 16 {
            self.stayed = true
            return false
        }
        return true 
    }
}