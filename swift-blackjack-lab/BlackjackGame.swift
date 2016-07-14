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
//    var house: House
    var dealer: Dealer
    var house: Player
//    var busted: Bool
//    var blackjack: Bool
//    
    
    init() {
        self.dealer = Dealer()
        self.player = Player()
        self.house = Player()
        self.player.busted = false
        self.house.busted = false
        self.house.blackjack = false
        self.player.blackjack = false 
    }
    
    func dealNewRound() {
        var i = 0
        while i < 2 {
            self.player.acceptCard(dealer.dealCard())
            self.house.acceptCard(dealer.dealCard())
            if let newValue = self.player.cards[i].cardValue {
                self.player.handscore += newValue
            }
            
            if let newHouseValue = self.house.cards[i].cardValue {
                self.house.handscore += newHouseValue
            }
            i += 1
        }
        self.player.checkStatus()
        self.house.checkStatus()
    }
    
    func hit() {
        let dealtCard = dealer.dealCard()
        self.player.acceptCard(dealtCard)
        self.player.handscore += dealtCard.cardValue!
        self.player.checkStatus()
        self.house.checkStatus()
//        if self.player.handscore > 21 {
//            self.player.busted = true
//        } else if self.player.handscore == 21 {
//            self.player.blackjack = true 
//        }
    }
    
    
    
//    func dealCard() -> Card {
//        let newCard = self.dealer.dealCard()
//        return newCard
//    }
    
    
    
//    func dealNewRound() {
//        var i = 0
//        while i < 2 {
//            self.dealer.dealCardToPlayer()
//            self.dealer.dealCardToHouse()
//            i += 1
//        }
//       
//        
//        self.dealer.dealRound(//)
    
//    func dealCardToPlayer() {
//        
//    }
//    
//    func dealCardToHouse() {
//        
//        
//    }
    
//    func houseWins() -> Bool {
//        return false 
//    }
}