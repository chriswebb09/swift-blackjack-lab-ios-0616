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
    
    
    init() {
        self.dealer = Dealer()
        self.player = Player()
        self.house = Player()
    }
    
    
    func dealNewRound() {
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
        self.player.handscore += dealtCard.cardValue!
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