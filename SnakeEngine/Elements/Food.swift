//
//  Food.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit
import GameplayKit

internal class Food: WorldElement {
    
    var node: SKSpriteNode
    var color = UIColor.red
    
    init(position: CGPoint) {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.node.position = position
        self.node.name = name
        
        self.initPhysicsBodyCharacteristics()
    }
}

extension Food: Physical {
    
    var contactCategory: UInt32 {
        return CollitionCategory.Food.rawValue
    }
    
    var collidesWithCategory: UInt32 {
        return CollitionCategory.SnakeHead.rawValue
    }
}

extension Food: Nameable {
    
    var name: String {
        return "SnakeFood"
    }
}
