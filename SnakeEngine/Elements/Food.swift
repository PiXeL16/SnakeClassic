//
//  Food.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

internal class Food: WorldElement {
    
    var node: SKNode
    var color = UIColor.red
    var size: CGSize
    
    let settings = SettingsFactory.buildSettings()
    
    init(position: CGPoint) {
        self.size = settings.elementSize
        self.node = SKSpriteNode(color: color, size: self.size)
        self.node.position = position
        self.node.name = name
        
        self.initPhysicsBodyCharacteristics()
    }
}

extension Food: Drawable {
    func update(){}
}

extension Food: Physical {
    
    var contactCategory: UInt32 {
        return CollitionCategory.Food.rawValue
    }
    
    var collidesWithCategory: UInt32 {
        return CollitionCategory.SnakeHead.rawValue
    }
}

extension Food: Nameable {
    
    var name: String {
        return "SnakeFood"
    }
}
