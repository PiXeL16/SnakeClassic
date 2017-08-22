//
//  File.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal class Tail: SnakePart {
    
    var node: SKSpriteNode
    var color = UIColor.white
    var vector: CGVector
    weak var referenceSnakePart: SnakePart?
    
    public init(referenceSnakePart: SnakePart) {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.vector = referenceSnakePart.vector
        self.node.name = name
        self.initPhysicsBodyCharacteristics()
        self.referenceSnakePart = referenceSnakePart
    }
}

extension Tail: Drawable {
    
    func update() {
        guard let reference = self.referenceSnakePart else {
            return
        }
        
        self.node.position = reference.node.position
    }
}

extension Tail: Movable {
    
    public func move(vector: CGVector) {
        
        self.vector = vector
    }
}

extension Tail: Physical {
    
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

extension Tail: Nameable {
    
    public var name: String {
        return "SnakeTail"
    }
}
