//
//  Food.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit
import GameplayKit

public class Food {
    
    public var node: SKSpriteNode
    public var color = UIColor.red
    
    public init(position: CGPoint) {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.node.position = position
        self.node.name = name
        
        self.initPhysicsBodyCharacteristics()
    }
}


extension Food: Physical {
    
    internal func initPhysicsBodyCharacteristics() {
        
        self.node.physicsBody = SKPhysicsBody(rectangleOf: self.node.size)
        self.node.physicsBody?.isDynamic = false
        self.node.physicsBody?.contactTestBitMask = 1
        self.node.physicsBody?.affectedByGravity = false
    }
    
    var physicsBody: SKPhysicsBody? {
        return self.node.physicsBody
    }
}

extension Food: Nameable {
    
    public var name: String {
        return "SnakeFood"
    }
}
