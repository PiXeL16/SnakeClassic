//
//  Food.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

internal class Border: WorldElement {
    
    var physicsBody: SKPhysicsBody?
    var shapeNode: SKShapeNode!
    let frame: CGRect
    
    let settings = SettingsFactory.buildSettings()
    
    init(frame: CGRect) {
        
        self.frame = frame
        self.shapeNode = SKShapeNode(rect: frame)
        self.shapeNode.strokeColor = self.color
        self.shapeNode.lineWidth = settings.elementSize.width
        initPhysicsBodyCharacteristics()
    }
    
    var size: CGSize {
        return self.frame.size
    }
    
    var color: UIColor {
        return Colors.borderColor
    }
    
    var node: SKNode {
        return shapeNode
    }
    
    func update() {
        
    }
}

extension Border: Physical {
    
    var contactCategory: UInt32 {
        return CollitionCategory.Border.rawValue
    }
    
    var collidesWithCategory: UInt32 {
        return CollitionCategory.SnakeHead.rawValue
    }
    
    
    func initPhysicsBodyCharacteristics() {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = self.contactCategory
        self.physicsBody?.contactTestBitMask = self.collidesWithCategory
        self.physicsBody?.collisionBitMask = 0
    }
}

extension Border: Nameable {
    
    var name: String {
        return "Border"
    }
}
