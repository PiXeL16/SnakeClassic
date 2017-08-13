//
//  SnakeTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import XCTest
@testable import SnakeEngine

class SnakeTests: XCTestCase {
    
    var snake: Snake!
    
    override func setUp() {
        super.setUp()
        
        self.snake = Snake()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSnakeInitializeWithCorrectValues() {
        
        XCTAssertEqual(snake.direction, .None)
        XCTAssertNotNil(snake.node)
        XCTAssertNotNil(snake.physicsBody)
        XCTAssertEqual(snake.velocity, CGVector(dx: 0, dy: 0))
        XCTAssertEqual(snake.node.name, snake.name)
        
    }
    
    func testSnakeTurnLeft() {
        let velocity = self.snake.velocity
        self.snake.left()
        
        XCTAssertEqual(snake.direction, .Left)
        XCTAssertNotEqual(velocity, snake.velocity)
    }
    
    func testSnakeTurnRight() {
        let velocity = self.snake.velocity
        self.snake.right()
        
        XCTAssertEqual(snake.direction, .Right)
        XCTAssertNotEqual(velocity, snake.velocity)
    }
    
    func testSnakeTurnUp() {
        let velocity = self.snake.velocity
        self.snake.up()
        
        XCTAssertEqual(snake.direction, .Up)
        XCTAssertNotEqual(velocity, snake.velocity)
    }
    
    func testSnakeTurnDown() {
        let velocity = self.snake.velocity
        self.snake.down()
        
        XCTAssertEqual(snake.direction, .Down)
        XCTAssertNotEqual(velocity, snake.velocity)
    }
    
}
