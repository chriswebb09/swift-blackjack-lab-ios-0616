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
    
    
    @IBOutlet weak var playerTokens: UILabel!
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
    
    
    @IBOutlet weak var houseTokens: UILabel!
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
        self.view.backgroundColor = UIColor.greenColor()
        self.game = BlackjackGame()
        self.houseCardViews = [houseCard1,houseCard2, houseCard3,  houseCard4, houseCard5]
        self.playerCardViews = [playerCard1, playerCard2, playerCard3, playerCard4, playerCard5]
        self.newGame()
    }
    
    
    func cardUI() {
        for card in self.houseCardViews {
            card.layer.backgroundColor = UIColor.whiteColor().CGColor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dealNewRound() {
        self.game.reset()
        self.newGame()
        self.updateViews()
        self.hit.enabled = false
        self.stay.enabled = false
    }
    
    func gameWon() {
        let winner = self.game.winner()
        self.winner.text = ("\(winner) Won")
        self.hit.enabled = false
        self.stay.enabled = false
        self.deal.enabled = true
    }
    
    
    func newGame() {
        self.houseCard1.hidden = true
        self.houseCard2.hidden = true
        self.houseCard3.hidden = true
        self.houseCard4.hidden = true
        self.houseCard5.hidden = true
        self.houseBusted.hidden = true
        self.houseBlackjack.hidden = true
        self.playerBlackjack.hidden = true
        self.playerStayed.hidden = true
        self.playerBusted.hidden = true
        self.houseStayed.hidden = true
        self.playerCard1.hidden = true
        self.playerCard2.hidden = true
        self.playerCard3.hidden = true
        self.playerCard4.hidden = true
        self.playerCard5.hidden = true
        self.winner.hidden = true
        self.deal.enabled = true
        self.hit.enabled = false
        self.stay.enabled = false
    }
    
    func showPlayerCards() {
        self.houseCard1.hidden = false
        self.houseCard2.hidden = false
        var i = 0
        while i < self.game.player.cards.count && i <= 5 {
            self.playerCardViews[i].hidden = false
            self.playerCardViews[i].text = self.game.player.cards[i].cardLabel
            i += 1
        }
        
    }
    
    func showHouseCards() {
        var i = 0
        while i < self.game.house.cards.count && i <= 5 {
            self.cardUI()
            self.houseCardViews[i].hidden = false
            self.houseCardViews[i].text = self.game.house.cards[i].cardLabel
            i += 1
        }
        
        self.updateScore()
        
    }
    
    func updateScore() {
        self.houseScore.text = "Score: \(String(self.game.house.handscore))"
        self.playerScore.text = "Score: \(String(self.game.player.handscore))"
        self.playerWins.text  = "Wins: \(String(self.game.player.wins))"
        self.houseWins.text = "Wins: \(String(self.game.house.wins))"
        self.playerLosses.text = "Losses: \(String(self.game.player.losses))"
        self.houseLosses.text = "Losses: \(String(self.game.house.losses))"
        self.houseTokens.text = "Tokens: \(self.game.house.tokens)"
        self.playerTokens.text = "Tokens: \(self.game.player.tokens)"
    }
    
    func updateViews() {
        self.getActiveLabels()
        self.showPlayerCards()
        self.updateScore()
    }
    
    
    @IBAction func stayButtonTapped(sender: AnyObject) {
        self.houseCard1.text = self.game.house.cards[0].cardLabel
        self.houseCard2.text = self.game.house.cards[1].cardLabel
        self.deal.enabled = true
        self.hit.enabled = false
        self.stay.enabled = false
        self.playerStayed.hidden = false
        self.showHouseCards()
        self.game.houseTurn()
        self.showHouseCards()
        self.houseScore.hidden = false
        let roundWinner = self.game.winner()
        self.winner.text = "\(roundWinner) Won"
        self.winner.hidden = false
        self.updateViews()
    }
    
    @IBAction func hitTapped(sender: AnyObject) {
        self.game.hit()
        if game.player.blackjack {
            self.playerBlackjack.hidden = false
            self.playerBusted.hidden = true
            self.winner.hidden = false
            self.gameWon()
            //self.dealNewRound()
//            print("New game started, player got blackjack")
        }
        if game.player.busted {
            self.playerBusted.hidden = false
            self.winner.hidden = false
            self.winner.text = "HOUSE WINS"
            self.gameWon()
            //self.dealNewRound()
        }
        self.updateViews()
        self.houseScore.text = "Score: 0"
    }
    
    @IBAction func dealTapped(sender: AnyObject) {
        self.dealNewRound()
        
        //self.houseScore.hidden = true
        self.game.dealNewRound()
        self.deal.enabled = false
        self.hit.enabled = true
        self.stay.enabled = true
        self.updateViews()
        self.houseScore.text = "Score: 0"
    }
    
    func houseTurn() {
        //        self.game.houseTurn()
        //        self.showHouseCards()
        //        self.game.reset()
    }
    
    func getActiveLabels() {
        if !self.game.player.busted {
            self.playerBusted.hidden = true
        } else if self.game.house.busted {
            self.houseBusted.hidden = false
        } else if !self.game.player.blackjack {
            self.playerBlackjack.hidden = true
        } else if self.game.house.blackjack {
            self.houseBlackjack.hidden = false
        }
    }
}

