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
    @IBOutlet weak var houseScore: UILabel!
    @IBOutlet weak var houseStayed: UILabel!
    @IBOutlet weak var houseWins: UILabel!
    @IBOutlet weak var houseLosses: UILabel!
    
    var houseCardViews: [String]
    var playerCardViews: [String]
    
    required init?(coder aDecoder: NSCoder) {
        self.houseCardViews = []
        self.playerCardViews = []
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private class func playerMayHit() {
        
    }
    
    private class func updateViews() {
        
    }
    
    func showPlayerCards() {
        
    }

    
    func showHouseCards() {
        
    }

}

