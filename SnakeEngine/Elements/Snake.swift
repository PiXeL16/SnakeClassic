//
//  Snake.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

public class Snake {
    
    public var node: SKSpriteNode
    public var color = UIColor.white
    public var direction: Direction
    
    public init() {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.direction = .None
        self.node.name = name
        self.initPhysicsBodyCharacteristics()
    }
}

extension Snake: Physical {
    
    var physicsBody: SKPhysicsBody? {
         return self.node.physicsBody
    }

    internal func initPhysicsBodyCharacteristics() {
        
        self.node.physicsBody = SKPhysicsBody(rectangleOf: self.node.size)
        self.node.physicsBody?.isDynamic = true
        self.node.physicsBody?.affectedByGravity = false
    }
}

extension Snake: Movable {
    
    public var velocity: CGVector {
        set (newVelocity) {
            self.physicsBody?.velocity = newVelocity
        }
        get {
            guard let velocity = self.physicsBody?.velocity else {
                return CGVector()
            }
            return velocity
        }
    }
}

extension Snake: Nameable {
    
    public var name: String {
        return "Snakeeeeeeeeeeeee!"
    }
}

extension Snake: Controllable {
    
    public func left() {
        self.direction = .Left
        self.velocity = CGVector(dx: -WorldConstants.velocity, dy: 0)
    }
    
    public func right() {
        self.direction = .Right
        self.velocity = CGVector(dx: WorldConstants.velocity, dy: 0)
    }
    
    public func up() {
        self.direction = .Up
        self.velocity = CGVector(dx: 0, dy: WorldConstants.velocity)
        
    }
    
    public func down() {
        self.direction = .Down
        self.velocity = CGVector(dx: 0, dy: -WorldConstants.velocity)
    }
}
