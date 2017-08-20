//
//  File.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

public class TailSection: WorldElement {
    
    public var node: SKSpriteNode
    public var color = UIColor.white
    public var direction: Direction
    public var vector: CGVector
    
    public init() {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.direction = .None
        self.vector = CGVector(dx: 0, dy: 0)
        self.node.name = name
        self.initPhysicsBodyCharacteristics()
    }
}

extension TailSection: Movable {
    
    public func move(vector: CGVector, completion: (() -> Void)?) {
        
        self.vector = vector
        self.node.removeAllActions()
        
        let action = SKAction.move(by: self.vector, duration: 1)
        
        self.node.run(SKAction.repeatForever(action), completion: {
            completion?()
        })
    }
}

extension TailSection: Physical {
    
    public var physicsBody: SKPhysicsBody? {
        return self.node.physicsBody
    }
    
    public var contactCategory: UInt32 {
        return CollitionCategory.SnakeTail.rawValue
    }
    
    public var collidesWithCategory: UInt32 {
        return CollitionCategory.SnakeHead.rawValue
    }

}

extension TailSection: Nameable {
    
    public var name: String {
        return "SnakeTail"
    }
}
