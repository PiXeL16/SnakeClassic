//
//  CollitionProvider.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal class CollitionDetection: Collider {
    
    weak var world: World?
    var collitionDetectors: [Collider]!
    
    
    init(world: World) {
        self.world = world
        
        if let world = self.world {
        
            self.collitionDetectors = [SnakeFoodCollition(world: world),
                                       SnakeTailCollition(world: world) ]
        }
    }

    func handleCollition(contactBodyA: SKPhysicsBody, contactBodyB: SKPhysicsBody) {
        
        for collitionDetector in self.collitionDetectors {
            
            collitionDetector.handleCollition(contactBodyA: contactBodyA, contactBodyB: contactBodyB)
            
        }
    }

}
