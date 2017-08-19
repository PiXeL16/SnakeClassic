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
    public var vector: CGVector
    
    public init() {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.direction = .None
        self.vector = CGVector(dx: 0, dy: 0)
        self.node.name = name
        
        self.initPhysicsBodyCharacteristics()
    }
}


extension Snake: Movable {
    
    public func move(vector: CGVector) {
        
        self.vector = vector
        self.node.removeAllActions()
        
        let action = SKAction.move(by: self.vector, duration: 1)
        self.node.run(SKAction.repeatForever(action))
    }
}

extension Snake: Physical {
    
    internal func initPhysicsBodyCharacteristics() {
        
        self.node.physicsBody = SKPhysicsBody(rectangleOf: self.node.size)
        self.node.physicsBody?.isDynamic = true
        self.node.physicsBody?.categoryBitMask = Snake.contactCategory
        self.node.physicsBody?.contactTestBitMask = Food.contactCategory
        self.node.physicsBody?.collisionBitMask = 0
    }
    
    var physicsBody: SKPhysicsBody? {
        return self.node.physicsBody
    }
    
    static var contactCategory: UInt32 {
        return ContactCategory.Snake.rawValue
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
        
        self.move(vector: CGVector(dx: -WorldConstants.velocity, dy: 0))
        
    }
    
    public func right() {
        self.direction = .Right
        
        self.move(vector: CGVector(dx: WorldConstants.velocity, dy: 0))
    }
    
    public func up() {
        self.direction = .Up
        
        self.move(vector: CGVector(dx: 0, dy: WorldConstants.velocity))
    }
    
    public func down() {
        self.direction = .Down
        
        self.move(vector: CGVector(dx: 0, dy: -WorldConstants.velocity))
    }
}
