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
    
    
    var snakeHead: Head!
    var food: Food!
    
    override func setUp() {
        super.setUp()
        
        snakeHead = Head()
        food = Food(position: CGPoint(x: 0, y: 0))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSortBodies() {
        
        var collitionHandler = CollitionHandler(contactBodyA: snakeHead.physicsBody!, contactBodyB: food.physicsBody!)
    
        XCTAssertEqual(collitionHandler.orderedBodies.0.categoryBitMask, snakeHead.contactCategory)
        XCTAssertEqual(collitionHandler.orderedBodies.1.categoryBitMask, food.contactCategory)
        
        collitionHandler = CollitionHandler(contactBodyA: snakeHead.physicsBody!, contactBodyB: food.physicsBody!)
        
        XCTAssertEqual(collitionHandler.orderedBodies.0.categoryBitMask, snakeHead.contactCategory)
        XCTAssertEqual(collitionHandler.orderedBodies.1.categoryBitMask, food.contactCategory)
    }
    
}
