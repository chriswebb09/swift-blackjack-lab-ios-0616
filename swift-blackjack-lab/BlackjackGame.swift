//
//  BlackjackGame.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class BlackjackGame {
    var player: Player
    var dealer: Dealer
    var house: Player
    
    init() {
        self.dealer = Dealer()
        self.player = Player()
        self.house = Player()
    }
    
    
    func dealNewRound() {
        self.dealer.shuffleDeck()
        self.newRound()
        var i = 0
        while i < 2 {
            self.player.acceptCard(dealer.dealCard())
            self.house.acceptCard(dealer.dealCard())
            i += 1
        }
    }
    
    func hit() {
        let dealtCard = dealer.dealCard()
        self.player.acceptCard(dealtCard)
    }
    
    func reset() {
        self.player.resetForNewGame()
        self.house.resetForNewGame()
    }
    
    func stayed() -> Bool {
        if self.player.turn {
            self.player.stayed = true
        } else if self.house.turn {
            self.house.stayed = true
        }
        return true
    }
    
    func newRound() {
        self.reset()
        self.dealer.shuffleDeck()
    }
    
    
    func houseTurn() {
        while self.house.shouldHit() {
            let newHouseCard = dealer.dealCard()
            self.house.acceptCard(newHouseCard)
            self.house.getScore()
        }
        
        if !self.house.shouldHit() {
            self.house.stayed = true
            self.house.getScore()
            self.endRound()
        }
    }
    
    func endRound() {
        if self.player.stayed && self.house.stayed {
            self.winner()
            self.player.stayed = true
            self.house.stayed = true
            self.house.getScore()
            self.reset()
        }
    }
    
    
    func winner() -> String {
        if self.player.handscore > self.house.handscore && !self.player.busted {
            self.player.won = true
            self.house.won = false
            self.house.getScore()
            print("Player Won House Handscore \(self.house.handscore)")
            self.player.wins += 1
            self.house.losses += 1
            return "Player"
        } else if self.player.busted {
            self.player.won = false
            self.house.won = true
            self.house.wins += 1
            self.player.losses += 1
            self.house.getScore()
            return "House"
        } else if self.house.busted {
            self.house.won = false
            self.player.won = true
            self.house.wins += 1
            self.player.losses += 1
            self.house.getScore()
            return "Player"
        } else if self.house.handscore > self.player.handscore && !self.house.busted {
            self.player.won = false
            self.house.won = true
            self.house.wins += 1
            print("\(self.house.wins)")
            self.player.losses += 1
            self.house.getScore()
            print("House Not Busted Player lost House Handscore \(self.house.handscore)")
            return "House"
        }  else if self.house.blackjack {
            self.house.won = true
            self.player.won = false
            self.house.wins += 1
            self.player.losses += 1
            self.house.getScore()
            print("House won House Handscore \(self.house.handscore)")
            return "House"
        } else if self.player.handscore > self.house.handscore {
            self.house.won = false
            self.player.won = true
            self.house.wins += 1
            self.player.losses += 1
            self.house.getScore()
            return "Player"
        } else if !self.player.busted && self.player.handscore < self.house.handscore && !self.house.busted {
            self.house.won = true
            self.player.won = false
            self.house.wins += 1
            self.player.losses += 1
            self.house.getScore()
            print("House Won Handscore \(self.house.handscore)")
            return "House"
        } else {
            self.player.won = false
            self.house.won = false
            self.house.getScore()
            print("Handscore \(self.house.handscore)")
            return "No"
        }
    }
    
}