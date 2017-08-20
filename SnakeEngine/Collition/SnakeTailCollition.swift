//
//  CollitionProvider.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal class SnakeTailCollition: Collider {
    
    weak var world: World?
    
    init(world: World) {
        self.world = world
    }
    
    func handleCollition(contactBodyA: SKPhysicsBody, contactBodyB: SKPhysicsBody) {
        
        let collitionHandler = CollitionHandler(contactBodyA: contactBodyA, contactBodyB: contactBodyB)
        
        if let orderedBodies = collitionHandler.orderedBodies {
            
            if(self.didCollidedSnakeAndTail(contactBodyA: orderedBodies.0, contactBodyB: orderedBodies.1)) {
                
                self.world?.restartGame()
            }
        }
    }
    
    func didCollidedSnakeAndTail(contactBodyA: SKPhysicsBody, contactBodyB: SKPhysicsBody) -> Bool {
        
        var collition = false
        
        if(contactBodyA.categoryBitMask == CollitionCategory.SnakeHead.rawValue &&
            contactBodyB.categoryBitMask == CollitionCategory.SnakeTail.rawValue) {
            collition = true
        }
        
        return collition
    }
    
}
