//
//  WorldMock.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit
@testable import SnakeEngine

class WorldMock: World {
   
    weak var scene: SKScene? = SKScene()
    var snake: Snake! = SnakeImplementation()
    var food: Food! = Food(position: CGPoint())
    var collitionDetection: Collider!
    
    var updateCalled = false
    var createSnakeCalled = false
    var createdFoodCalled = false
    var growSnakeCalled = false
    var rightCalled = false
    var leftCalled = false
    var upCalled = false
    var downCalled = false
    var gameRestartedCalled = false
    var snakeEatFoodCalled = false
    
    
    public var height: CGFloat {
        return 150
    }
    
    public var width: CGFloat {
        return 150
    }
    
    public init() {
        self.collitionDetection = CollitionDetection(world: self)
    }
    
    
    public func update(currentTime: TimeInterval) {
        updateCalled = true
    }
    
    
    public func createSnake() {
        createSnakeCalled = true
    }
    
    public func createFood() {
        createdFoodCalled = true
    }
    
    public func growSnake() {
        growSnakeCalled = true
    }
    
    public func restartGame() {
        gameRestartedCalled = true
    }
    
    public func snakeEatFood() {
        snakeEatFoodCalled = true
    }

}


extension WorldMock: Controllable {
    
    public func right() {
        rightCalled = true
    }
    
    public func left() {
       leftCalled = true
    }
    
    public func up() {
        upCalled = true
    }
    
    public func down() {
       downCalled = true
    }
}

