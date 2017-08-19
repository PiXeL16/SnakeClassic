//
//  File.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

public class TailSection: Drawable {
    
    public var node: SKSpriteNode
    public var color = UIColor.white
    public var direction: Direction
    public var vector: CGVector
    
    public init(position: CGPoint, vector: CGVector) {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.direction = .None
        self.vector = vector
        self.node.name = name
        self.node.position = position
        
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
    
    internal func initPhysicsBodyCharacteristics() {
        
        self.node.physicsBody = SKPhysicsBody(rectangleOf: self.node.size)
        self.node.physicsBody?.isDynamic = true
        self.node.physicsBody?.categoryBitMask = TailSection.contactCategory
        self.node.physicsBody?.contactTestBitMask = Snake.contactCategory
        self.node.physicsBody?.collisionBitMask = 0
    }
    
    var physicsBody: SKPhysicsBody? {
        return self.node.physicsBody
    }
    
    static var contactCategory: UInt32 {
        return CollitionCategory.SnakeTail.rawValue
    }
}

extension TailSection: Nameable {
    
    public var name: String {
        return "SnakeTail"
    }
}
