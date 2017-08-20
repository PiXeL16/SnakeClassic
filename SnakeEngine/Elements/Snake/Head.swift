//
//  Snake.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

internal class Head: SnakePart {
    
    public var node: SKSpriteNode
    public var color = UIColor.white
    public var direction: Direction
    public var vector: CGVector
    
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
        
        var node: SKSpriteNode
        
        if tail.sections.isEmpty {
            node = tail.addSection(withReference: self).node
        } else {
            node = tail.addNextSection().node
        }
        return node
    }
}

extension Head: Movable {
    
    public func move(vector: CGVector, completion: (() -> Void)?) {
        
        self.vector = vector
        self.node.removeAllActions()
        
        let action = SKAction.move(by: self.vector, duration: 1)
        
        self.node.run(SKAction.repeatForever(action), completion: {
            completion?()
        })
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

extension Head: Physical {
    
    var contactCategory: UInt32 {
        return CollitionCategory.SnakeHead.rawValue
    }
    
    var collidesWithCategory: UInt32 {
        return CollitionCategory.SnakeTail.rawValue
    }
}

extension Head: Nameable {
    
    var name: String {
        return "Snakeeeeeeeeeeeee!"
    }
}

extension Head: Controllable {
    
    public func left() {
        self.direction = .Left
    
        self.move(vector: CGVector(dx: -WorldConstants.velocity, dy: 0), completion: nil)
    }
    
    public func right() {
        self.direction = .Right
        
        self.move(vector: CGVector(dx: WorldConstants.velocity, dy: 0), completion: nil)
    }
    
    public func up() {
        self.direction = .Up
        
        
        self.move(vector: CGVector(dx: 0, dy: WorldConstants.velocity), completion: nil)
    }
    
    public func down() {
        self.direction = .Down
        
        self.move(vector: CGVector(dx: 0, dy: -WorldConstants.velocity), completion: nil)
    }
}
