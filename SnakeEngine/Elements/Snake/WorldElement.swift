//
//  SnakePart.swift
//  SnakeEngine
//
//  Created by Chris Jimenez on 8/20/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal protocol WorldElement: Drawable, Physical {
    
}

extension WorldElement {
    
    public func initPhysicsBodyCharacteristics() {
        
        self.node.physicsBody = SKPhysicsBody(rectangleOf: self.node.size)
        self.node.physicsBody?.isDynamic = true
        self.node.physicsBody?.categoryBitMask = self.contactCategory
        self.node.physicsBody?.contactTestBitMask = self.collidesWithCategory
        self.node.physicsBody?.collisionBitMask = 0
    }
    
    public var physicsBody: SKPhysicsBody? {
        return self.node.physicsBody
    }
    
}
