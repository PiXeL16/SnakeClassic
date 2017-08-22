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
    
    var border: Border! = Border(frame: CGRect())
    var score: Score! = Score(position: CGPoint())
    
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
    var createBorderCalled = false
    var createScoreCalled = false
    var advanceScoreCalled = false
    
    
    public var frame: CGRect {
        return CGRect()
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
    
    public func createBorder() {
        createBorderCalled = true
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
    
    public func createScore() {
        createScoreCalled = true
    }
    
    public func advanceScore() {
        advanceScoreCalled = true
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

