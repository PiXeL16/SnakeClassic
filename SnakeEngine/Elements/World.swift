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


public class World {
    
    weak var scene: SKScene?
    var snake: Snake!
    var food: Food!
    
    var height: CGFloat {
        
        guard let height = self.scene?.view?.bounds.height else {
            return 0
        }
        return height
    }
    
    var width: CGFloat {
        
        guard let width = self.scene?.view?.bounds.width else {
            return 0
        }
        return width
    }
    
    public init(scene: SKScene) {
        self.scene = scene
        
        createSnake()
        
        createFood()
    }
    
    
    public func update() {
        
    }
    
    public func handleContact(contact: SKPhysicsContact) {
        
        createFood()
        
    }
    
    private func createSnake() {
        
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


extension World: Controllable {
    
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
