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

class CollitionHandlerTests: XCTestCase {
    
    
    var snakeBody: SKPhysicsBody!
    var foodBody: SKPhysicsBody!
    
    override func setUp() {
        super.setUp()
        
        snakeBody = Snake().physicsBody
        foodBody = Food(position: CGPoint(x: 0, y: 0)).physicsBody
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSortBodies() {
        
        var collitionHandler = CollitionHandler(contactBodyA: snakeBody, contactBodyB: foodBody)
    
        XCTAssertEqual(collitionHandler.orderedBodies.0.categoryBitMask, Snake.contactCategory)
        XCTAssertEqual(collitionHandler.orderedBodies.1.categoryBitMask, Food.contactCategory)
        
        collitionHandler = CollitionHandler(contactBodyA: foodBody, contactBodyB: snakeBody)
        
        XCTAssertEqual(collitionHandler.orderedBodies.0.categoryBitMask, Snake.contactCategory)
        XCTAssertEqual(collitionHandler.orderedBodies.1.categoryBitMask, Food.contactCategory)
    }
    
    
    func testDidCollidedSnakeAndFood() {
        
        var collitionHandler = CollitionHandler(contactBodyA: snakeBody, contactBodyB: foodBody)
        
        XCTAssertTrue(collitionHandler.didCollidedSnakeAndFood())
        
        collitionHandler = CollitionHandler(contactBodyA: foodBody, contactBodyB: snakeBody)
        
        XCTAssertTrue(collitionHandler.didCollidedSnakeAndFood())
        
    }
    
}
