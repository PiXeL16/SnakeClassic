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
        self.node.physicsBody?.isDynamic = true
        self.node.physicsBody?.categoryBitMask = Food.contactCategory
        self.node.physicsBody?.contactTestBitMask = Snake.contactCategory
        self.node.physicsBody?.collisionBitMask = 0
    }
    
    var physicsBody: SKPhysicsBody? {
        return self.node.physicsBody
    }
    
    static var contactCategory: UInt32 {
        return ContactCategory.Food.rawValue
    }
}

extension Food: Nameable {
    
    public var name: String {
        return "SnakeFood"
    }
}
