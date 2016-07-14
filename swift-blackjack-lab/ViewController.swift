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
    
//    required init?(coder aDecoder: NSCoder) {
//        self.houseCardViews = []
//        self.playerCardViews = []
//        fatalError("init(coder:) has not been implemented")
//    }
//    

    override func viewDidLoad() {
        super.viewDidLoad()
       self.houseCardViews = [houseCard1,houseCard2, houseCard3,  houseCard4, houseCard5]
        self.playerCardViews = [playerCard1, playerCard2, playerCard3, playerCard4, playerCard5]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dealNewRound() {
        houseCard1.hidden = true
        houseCard2.hidden = true
        houseCard3.hidden = true
        houseCard4.hidden = true
        houseCard5.hidden = true
        playerCard1.hidden = true
        playerCard2.hidden = true
        playerCard3.hidden = true
        playerCard4.hidden = true
        playerCard5.hidden = true
        self.deal.enabled = false
        self.hit.enabled = true
        self.stay.enabled = true
    }
    
    
    
    private class func playerMayHit() {
        
    }
    
    private class func updateViews() {
        
    }
    
    func showPlayerCards() {
        
    }

    
    func showHouseCards() {
        
    }

    @IBAction func stayButtonTapped(sender: AnyObject) {
        self.deal.enabled = true
        self.hit.enabled = false
        self.stay.enabled = false 
    }
    @IBAction func hitTapped(sender: AnyObject) {
    }
    
    
    @IBAction func dealTapped(sender: AnyObject) {
        self.deal.enabled = false
        self.hit.enabled = true
        self.stay.enabled = true
        
    }
}

