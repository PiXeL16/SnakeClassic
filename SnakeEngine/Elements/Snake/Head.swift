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
    var direction: Direction
    weak var referenceSnakePart: SnakePart?
    
    init() {
        self.node = SKSpriteNode(color: color, size: WorldConstants.objectSize)
        self.vector = CGVector(dx: 0, dy: 0)
        self.direction = Direction.None
        self.node.name = name
        self.initPhysicsBodyCharacteristics()
    }
}

extension Head: Drawable {
    
    func update() {
        
        self.node.position.x = self.node.position.x + vector.dx * (WorldConstants.objectSize.width + WorldConstants.margin )
        self.node.position.y = self.node.position.y + vector.dy * (WorldConstants.objectSize.height + WorldConstants.margin)
        
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
        self.direction = .Left
        self.move(vector: CGVector(dx: -WorldConstants.velocity, dy: 0))
    }
    
    func right() {
        self.direction = .Right
        self.move(vector: CGVector(dx: WorldConstants.velocity, dy: 0))
    }
    
    func up() {
        self.direction = .Up
        self.move(vector: CGVector(dx: 0, dy: WorldConstants.velocity))
    }
    
    func down() {
        self.direction = .Down
        self.move(vector: CGVector(dx: 0, dy: -WorldConstants.velocity))
    }
}
