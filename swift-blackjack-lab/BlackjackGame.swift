//
//  BlackjackGame.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class BlackjackGame {
    
    var score: Int
    var wins: Int
    var player: Player
    var house: House
    var dealer: Dealer
    
    
    init() {
        self.score = 0
        self.wins = 0
        
    }
    
    func playBlackjack() {
        
    }
    
    func dealNewRound() {
        self.dealer.dealRound()
    }
    
    func dealCardToPlayer() {
        
    }
    
    func dealCardToHouse() {
        
        
    }
    
    func houseWins() -> Bool {
        return false 
    }
}