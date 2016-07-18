//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Christopher Webb-Orenstein on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class House: Player {
    
    override init(name: String)
    {
        super.init(name: name)
        self.tokens = 1000
    }
    
    func mustHit() -> Bool
    {
        if self.handscore <= 17
        {
            return true
        }
        return false
        
    }
    
}