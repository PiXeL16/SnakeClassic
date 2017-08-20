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

public class WorldMock: World {
   
    public weak var scene: SKScene? = SKScene()
    public var snake: Head! = Head()
    public var food: Food! = Food(position: CGPoint())
    public var collitionDetection: Collider!
    
    public var updateCalled = false
    public var createSnakeCalled = false
    public var createdFoodCalled = false
    public var growSnakeCalled = false
    public var rightCalled = false
    public var leftCalled = false
    public var upCalled = false
    public var downCalled = false
    public var gameRestartedCalled = false
    
    
    public var height: CGFloat {
        return 150
    }
    
    public var width: CGFloat {
        return 150
    }
    
    public init() {
        self.collitionDetection = CollitionDetection(world: self)
    }
    
    
    public func update() {
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

