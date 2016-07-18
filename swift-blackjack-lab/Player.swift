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
//    var didWin: Bool {
//        return self.tokens - self.bet
//    }
    var mustHit: Bool {
        if self.handscore <= 16 {
            return true
        }
        return false
    }
//    var bet: UInt
    var tokens: UInt
    var wins: UInt
    var numberOfAces: UInt
    var losses: UInt
    var turn: Bool
    var won: Bool
    var handscore: UInt {
        let score = getScore()
        self.description = self.description + "Handscore: \(score)"
        return score
    }
    var blackjack: Bool {
        var gotBlackjack: Bool = false
        if self.handscore == 21 {
            gotBlackjack = true
        }
        self.description = self.description + "Blackjack: \(gotBlackjack)"
        return gotBlackjack
    }
    var busted: Bool {
        var isBusted: Bool = false
        if self.handscore > 21 {
            isBusted = true
        }
        self.description = self.description + "Busted: \(isBusted)"
        return isBusted
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
        self.tokens = 100
        self.wins = 0
        self.losses = 0
        self.turn = false
        self.stayed = false
        self.won = false
        self.numberOfAces = 0
        self.description = "\(self.name) Cards:\(self.cards) Tokens:\(self.tokens) Stayed: \(self.stayed)"
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
//            print("\(name) Turn ")
//            print("busted")
//            print("\(name) \(name)")
//            print("BUSTED \(cards)")
            for card in cards {
                cardString = card.cardLabel
                self.description.stringByAppendingString("Card String Description \(cardString)")
//                print("\(cardString)")
//                print("\(card.cardLabel)")
//                print(description)
            }
        }
        if self.handscore == 21 {
//            print("blackjack")
            self.turn = false
            self.blackjack
//            print("\(name) Turn ")
//            print("\(name) \(cards)")
//            print("Blackjack \(name)")
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
        
    func acceptCard(card: Card) {
        self.cards.append(card)
    }
    
    func canPlaceBet(bet:UInt) -> Bool {
        if bet <= self.tokens {
            return true 
        }
        return false
    }
    
    func shouldHit() -> Bool {
        if self.handscore <= 16 {
            return true
        }
        return false 
    }
    
    func didWin(bet:UInt) {
        self.tokens += bet
    }
    
    func didLose(bet:UInt) {
        self.tokens -= bet
    }
    
//    func shouldHit() -> Bool {
//        if self.handscore >= 16 {
//            self.stayed = true
//            return false
//        }
//        return true 
//    }
}