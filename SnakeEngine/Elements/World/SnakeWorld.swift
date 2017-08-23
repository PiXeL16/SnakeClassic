//
//  World.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

public class SnakeWorld: NSObject, World {
    
    public weak var scene: SKScene?
    internal var snake: Snake!
    internal var food: Food!
    internal var border: Border!
    internal var score: Score!
    internal var collitionDetection: Collider!
    internal var timeOfLastMove = 0.0
    
    let settings = SettingsFactory.buildSettings()
    
    public var frame: CGRect {
        
        guard let frame = self.scene?.frame else {
            return CGRect()
        }
        return frame
    }
    
    public init(scene: SKScene) {
        
        super.init()
        
        self.scene = scene
        
        self.scene?.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        self.scene?.physicsWorld.contactDelegate = self
        
        self.collitionDetection = CollitionDetection(world: self)
        
        self.restartGame()
    
    }
    
    
    public func update(currentTime: TimeInterval) {
        
        if (currentTime - self.timeOfLastMove < settings.timeFrameDelayer) {
            return
        }

        self.snake.update()
        
        self.timeOfLastMove = currentTime
        
    }
    
    public func restartGame() {
        
        self.scene?.removeAllChildren()
        
        createScore()
        
        createBorder()
        
        createSnake()
        
        for _ in 1...50 {
            createFood()    
        }
        
    }
    
    internal func createSnake() {
        
        self.snake = SnakeImplementation()
        self.scene?.addChild(snake.head.node)
        
    }
    
    internal func snakeEatFood() {
        self.createFood()
        self.growSnake()
        self.advanceScore()
    }
    
    internal func createBorder() {
        
        self.border = Border(frame: self.frame)
        self.scene?.physicsBody = border.physicsBody
        self.scene?.addChild(border.node)
    
    }
    
    internal func createScore() {
        
        self.score = Score(position: CGPoint(x: frame.midX, y: frame.maxY - settings.distance * 3))
        self.scene?.addChild(score.node)
    }
    
    internal func advanceScore() {
        self.score.advanceScore()
    }
    
    internal func createFood() {
        
         let randomPoint = frame.randomPointInRectWithMargin(margin: settings.distance)
        
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
