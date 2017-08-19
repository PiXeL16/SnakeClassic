//
//  CGPointExtensionsTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//
import XCTest
import SpriteKit
@testable import SnakeEngine

class CollitionDetectionTests: XCTestCase {
    
    
    var collitionDetection: Collider!
    var world: WorldMock!
    var snakeBody: SKPhysicsBody!
    var foodBody: SKPhysicsBody!
    
    override func setUp() {
        super.setUp()
        
        world = WorldMock()
        collitionDetection = CollitionDetection(world: world)
        
        snakeBody = Snake().physicsBody
        foodBody = Food(position: CGPoint(x: 0, y: 0)).physicsBody
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateFoodAfterSnakeEatsFood() {
        
        collitionDetection.handleCollition(contactBodyA: snakeBody, contactBodyB: foodBody)
        
        XCTAssertTrue(world.createdFoodCalled)
        
    }
    
}
