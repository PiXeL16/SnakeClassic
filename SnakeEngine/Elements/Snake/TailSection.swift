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
    public weak var reference: Drawable?
    
    public init(reference: Drawable) {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.direction = .None
        self.vector = CGVector(dx: 0, dy: 0)
        self.node.name = name
        self.reference = reference
        self.initPhysicsBodyCharacteristics()
        
        self.follow()
    }
    
    func follow() {
        
        if let reference = self.reference {
            
            let rangeToSprite = SKRange(lowerLimit: 40, upperLimit: 20)
        
            let distanceConstraint = SKConstraint.distance(rangeToSprite, to: reference.node)
            
            self.node.constraints = [distanceConstraint]
            
        }
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
