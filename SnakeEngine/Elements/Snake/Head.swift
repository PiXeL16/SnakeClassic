//
//  Snake.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

internal class Head: SnakePart {
    
    var node: SKSpriteNode
    var color = UIColor.white
    var vector: CGVector
    weak var referenceSnakePart: SnakePart?
    
    init() {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.vector = CGVector(dx: 0, dy: 0)
        self.node.name = name
        self.initPhysicsBodyCharacteristics()
    }
}

extension Head: Drawable {
    
    func update() {
        
        
        self.node.position.x = self.node.position.x + vector.dx * (WorldConstants.objectSize.width + 5 )
        self.node.position.y = self.node.position.y + vector.dy * (WorldConstants.objectSize.height + 5)

//        self.node.position.updateWithVector(vector: self.vector)
        
    }
}

extension Head: Movable {
    
    func move(vector: CGVector) {
        
        self.vector = vector
    }
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
        return "SnakeHead"
    }
}


extension Head: Controllable {
    
    func left() {
        self.move(vector: CGVector(dx: -WorldConstants.velocity, dy: 0))
    }
    
    func right() {
        self.move(vector: CGVector(dx: WorldConstants.velocity, dy: 0))
    }
    
    func up() {
        self.move(vector: CGVector(dx: 0, dy: WorldConstants.velocity))
    }
    
    func down() {
        self.move(vector: CGVector(dx: 0, dy: -WorldConstants.velocity))
    }
}
