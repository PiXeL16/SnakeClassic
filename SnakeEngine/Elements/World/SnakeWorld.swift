//
//  World.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


public class SnakeWorld: NSObject, World {
    
    public weak var scene: SKScene?
    public var snake: Snake!
    public var food: Food!
    
    public var collitionDetection: Collider!
    
    public var height: CGFloat {
        
        guard let height = self.scene?.view?.bounds.height else {
            return 0
        }
        return height
    }
    
    public var width: CGFloat {
        
        guard let width = self.scene?.view?.bounds.width else {
            return 0
        }
        return width
    }
    
    public init(scene: SKScene) {
        
        super.init()
        
        self.scene = scene
        
        self.scene?.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        self.scene?.physicsWorld.contactDelegate = self
        
        self.collitionDetection = CollitionDetection(world: self)
        
        createSnake()
        
        createFood()
    }
    
    
    public func update() {
        
    }
    
    
    public func createSnake() {
        
        self.snake = Snake()
        self.scene?.addChild(snake.node)
        
    }
    
    public func createFood() {
        
         let randomPoint = CGPoint.randomPoint(rangeHeight: height - WorldConstants.objectSize.height,
                                               rangeWidth: width - WorldConstants.objectSize.width)
        
         self.food = Food(position: randomPoint)
        
         self.scene?.childNode(withName: food.name)?.removeFromParent()
        
         self.scene?.addChild(food!.node)
    }
    
}


extension SnakeWorld: Controllable {
    
    public func right() {
        snake.right()
    }
    
    public func left() {
        snake.left()
    }
    
    public func up() {
        snake.up()
    }
    
    public func down() {
        snake.down()
    }
}


extension SnakeWorld: SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        
        self.collitionDetection.handleCollition(contactBodyA: contact.bodyA, contactBodyB: contact.bodyB)
    }
}
