//
//  SnakeImp.swift
//  Snake
//
//  Created by Chris Jimenez on 8/20/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

// SnakeImplementation for a lack of better name... Snake Classic?, SnakieTheGreat?.....
internal class SnakeImplementation: Snake {
    
    var head: Head
    var direction: Direction
    var body: [SnakePart]
    
    public init() {
        
        self.direction = .None
        self.head = Head()
        self.body = [SnakePart]()
        self.body.append(head)
    }
    
    
    public func grow() -> SKSpriteNode {
        
        return SKSpriteNode()
        
//        var node: SKSpriteNode
//        
//        if tail.sections.isEmpty {
//            node = tail.addSection(withReference: self).node
//        } else {
//            node = tail.addNextSection().node
//        }
//        return node
    }
}



extension SnakeImplementation: Controllable {
    
    public func left() {
        
        guard self.direction != .Right else {
            return
        }
        
        self.direction = .Left
        
        self.head.left()
    }
    
    public func right() {
        
        guard self.direction != .Left else {
            return
        }
        
        self.direction = .Right
        
        self.head.right()
    }
    
    public func up() {
        
        guard self.direction != .Down else {
            return
        }
        
        self.direction = .Up
        
        self.head.up()
    }
    
    public func down() {
        
        guard self.direction != .Up else {
            return
        }
        
        self.direction = .Down
        
        self.head.down()
    }
}
