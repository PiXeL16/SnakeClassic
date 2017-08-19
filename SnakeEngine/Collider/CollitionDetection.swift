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
    
    init(world: World) {
        self.world = world
    }

    func handleCollition(contactBodyA: SKPhysicsBody, contactBodyB: SKPhysicsBody) {
        
        let collitionHandler = CollitionHandler(contactBodyA: contactBodyA, contactBodyB: contactBodyB)
        
        if(collitionHandler.didCollidedSnakeAndFood()) {
            
            self.world?.createFood()
        }        
    }

}
