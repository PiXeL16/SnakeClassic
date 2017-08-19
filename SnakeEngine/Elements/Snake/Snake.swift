//
//  Snake.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

public class Snake: Drawable {
    
    public var node: SKSpriteNode
    public var color = UIColor.white
    public var direction: Direction
    public var vector: CGVector
    
    public var xspeed: CGFloat = 0
    public var yspeed: CGFloat = 0
    
    public let tail: Tail
    
    public init() {
        self.tail = Tail()
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.direction = .None
        self.vector = CGVector(dx: 0, dy: 0)
        self.node.name = name
        
        self.initPhysicsBodyCharacteristics()
    }
    
    public func grow() -> SKSpriteNode {
        
        let node = tail.addSection(position: self.node.position, vector: self.vector).node
        return node
    }
}

extension Snake: Movable {
    
    public func move() {
        
        self.node.position.x = self.node.position.x + xspeed
        self.node.position.y = self.node.position.y + yspeed
    }
    
//    private func moveTail() {
//        
//        if !tail.sections.isEmpty {
//            
//            for section in tail.sections
//            
//        }
//    }
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
        return CollitionCategory.Snake.rawValue
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
        
        xspeed = -1
        yspeed = 0
        
        //self.move(vector: CGVector(dx: -WorldConstants.velocity, dy: 0), completion: nil)
    }
    
    public func right() {
        self.direction = .Right
        
        xspeed = 1
        yspeed = 0
        
        //self.move(vector: CGVector(dx: WorldConstants.velocity, dy: 0), completion: nil)
    }
    
    public func up() {
        self.direction = .Up
        
        xspeed = 0
        yspeed = 1
        
        //self.move(vector: CGVector(dx: 0, dy: WorldConstants.velocity), completion: nil)
    }
    
    public func down() {
        self.direction = .Down
        
        xspeed = 0
        yspeed = -1
        //self.move(vector: CGVector(dx: 0, dy: -WorldConstants.velocity), completion: nil)
    }
}
