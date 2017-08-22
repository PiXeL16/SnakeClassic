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
    internal var snake: Snake!
    internal var food: Food!
    internal var collitionDetection: Collider!
    internal var timeOfLastMove = 0.0
    
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
        
        restartGame()
    }
    
    
    public func update(currentTime: TimeInterval) {
        
        if (currentTime - self.timeOfLastMove < WorldConstants.timeFrameDelayer){
            return
        }

        
        self.snake.update()
        
        self.timeOfLastMove = currentTime
        
    }
    
    
    public func restartGame() {
        
        self.scene?.removeAllChildren()
        
        createSnake()
        
        createFood()
        
    }
    
    
    internal func createSnake() {
        
        self.snake = SnakeImplementation()
        self.scene?.addChild(snake.head.node)
        
    }
    
    internal func snakeEatFood() {
        self.createFood()
        self.growSnake()
    }
    
    
    internal func createFood() {
        
         let randomPoint = CGPoint.randomPoint(rangeHeight: height - WorldConstants.objectSize.height,
                                               rangeWidth: width - WorldConstants.objectSize.width)
        
         self.food = Food(position: randomPoint)
        
         self.scene?.childNode(withName: food.name)?.removeFromParent()
        
         self.scene?.addChild(food.node)
    }
    
    public func growSnake() {
        let node = self.snake.grow()
        self.scene?.addChild(node)
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
