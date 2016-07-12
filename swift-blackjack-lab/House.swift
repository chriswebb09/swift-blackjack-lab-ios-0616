//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class House: Player {
    var wallet: UInt
    var mustHit: Bool
    
    init() {
        super.init(name: "House")
        self.wallet = 100
        self.mustHit = true
    }
    
}