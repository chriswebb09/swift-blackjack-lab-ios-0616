//
//  ViewController.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var deal: UIButton!
    @IBOutlet weak var hit: UIButton!
    @IBOutlet weak var stay: UIButton!
    
    
    @IBOutlet weak var player: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var playerWins: UILabel!
    @IBOutlet weak var playerLosses: UILabel!
    @IBOutlet weak var playerBusted: UILabel!
    @IBOutlet weak var playerBlackjack: UILabel!
    @IBOutlet weak var playerCard1: UILabel!
    @IBOutlet weak var playerCard2: UILabel!
    @IBOutlet weak var playerCard3: UILabel!
    @IBOutlet weak var playerCard4: UILabel!
    @IBOutlet weak var playerCard5: UILabel!
    @IBOutlet weak var playerStayed: UILabel!
    
    
    @IBOutlet weak var house: UILabel!
    @IBOutlet weak var houseStayed: UILabel!
    @IBOutlet weak var houseScore: UILabel!
    @IBOutlet weak var houseWins: UILabel!
    @IBOutlet weak var houseLosses: UILabel!
    @IBOutlet weak var houseBusted: UILabel!
    @IBOutlet weak var houseBlackjack: UILabel!
    @IBOutlet weak var houseCard1: UILabel!
    @IBOutlet weak var houseCard2: UILabel!
    @IBOutlet weak var houseCard3: UILabel!
    @IBOutlet weak var houseCard4: UILabel!
    @IBOutlet weak var houseCard5: UILabel!
    
    
    var houseCardViews: [UILabel]!
    var playerCardViews: [UILabel]!
    var game: BlackjackGame!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.game = BlackjackGame()
        self.houseCardViews = [houseCard1,houseCard2, houseCard3,  houseCard4, houseCard5]
        self.playerCardViews = [playerCard1, playerCard2, playerCard3, playerCard4, playerCard5]
        houseBusted.hidden = true
        houseBlackjack.hidden = true
        playerStayed.hidden = true
        playerBusted.hidden = true
        playerBlackjack.hidden = true
        //playerStayed.hidden = true
        dealRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dealRound() {
        self.game.player.handscore = 0
        self.game.house.handscore = 0
        houseCard1.hidden = true
        houseCard2.hidden = true
        houseCard3.hidden = true
        houseCard4.hidden = true
        houseCard5.hidden = true
        houseBusted.hidden = true
        houseBlackjack.hidden = true
        playerStayed.hidden = true
        houseStayed.hidden = true
        playerCard1.hidden = true
        playerCard2.hidden = true
        playerCard3.hidden = true
        playerCard4.hidden = true
        playerCard5.hidden = true
        winner.hidden = true
        self.deal.enabled = true
        self.hit.enabled = true
        self.stay.enabled = true
        self.updateViews()
        self.updateScore()
    }
    
    
    
    private class func playerMayHit() {
        
    }
    
    func updateViews() {
        self.getActiveLabels()
        self.showPlayerCards()
        self.updateScore()
    }
    
    func showPlayerCards() {
        var i = 0
        while i < self.game.player.cards.count {
            self.playerCardViews[i].hidden = false
            self.playerCardViews[i].text = self.game.player.cards[i].cardLabel
            i += 1
        }
        
    }

    
    func showHouseCards() {
        var i = 0
        while i < self.game.house.cards.count {
            self.houseCardViews[i].hidden = false
            self.houseCardViews[i].text = self.game.house.cards[i].cardLabel
            i += 1
        }
        
    }
    
    func updateScore() {
        self.houseScore.text = "Score: \(String(self.game.house.handscore))"
        self.playerScore.text = "Score: \(String(self.game.player.handscore))"
    }
    
//    func newRound() {
//        self.game.player.cards.removeAll()
//        self.game.house.cards.removeAll()
//        self.game.player.handscore = 0
//        self.game.house.handscore = 0
//    }
//    
    func getActiveLabels() {
        self.game.player.checkStatus()
        self.game.house.checkStatus()
        if !self.game.player.busted {
            self.playerBusted.hidden = true
        } else if !self.game.house.busted {
            self.houseBusted.hidden = true
        } else if !self.game.player.blackjack {
            self.playerBlackjack.hidden = true
        } else if !self.game.house.blackjack {
            self.houseBlackjack.hidden = true
        }
        
        
//        if self.game.player.busted {
//            self.playerBusted.hidden = false
//        } else if self.game.player.blackjack {
//            self.playerBlackjack.hidden = false
//        } else if self.game.house.busted {
//            self.houseBusted.hidden = false
//        } else if self.game.house.blackjack {
//            self.houseBlackjack.hidden = false
//        }
    }

    @IBAction func stayButtonTapped(sender: AnyObject) {
        self.houseScore.hidden = false
        self.deal.enabled = true
        self.hit.enabled = false
        self.stay.enabled = false
        self.playerStayed.hidden = false
        self.game.houseTurn()
        self.showHouseCards()
    }
    @IBAction func hitTapped(sender: AnyObject) {
        //self.game.player.acceptCard(self.game.dealer.dealCard())
        self.game.hit()
        if game.player.handscore == 21 {
            self.playerBlackjack.hidden = false
            self.playerBusted.hidden = true
            self.winner.hidden = false
        }
        if game.player.handscore > 21 {
            self.playerBusted.hidden = false
        }
//        self.updateScore()
        self.updateViews()
    }
    
    
    
    @IBAction func dealTapped(sender: AnyObject) {
        self.newRound()
        self.dealRound()
        self.houseScore.text = "Score: 0"
        self.game.dealNewRound()
        self.deal.enabled = true
        self.hit.enabled = true
        self.stay.enabled = true
        self.updateViews()
    }
    
//    func houseTurn() {
//        self.game.houseTurn()
//    }
    
    func newRound() {
        
        for handCard in self.game.player.cards {
            handCard.cardLabel = ""
            handCard.cardValue = 0
        }
        //self.updateViews()
        self.game.reset()
        self.updateViews()
    }
}

