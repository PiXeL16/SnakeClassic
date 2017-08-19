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
        XCTAssertEqual(snake.vector, CGVector(dx: 0, dy: 0))
        XCTAssertNotNil(snake.name)
        XCTAssertEqual(snake.node.name, snake.name)
        XCTAssertNotNil(snake.physicsBody)
        XCTAssertNotNil(snake.tail)
        
    }
    
    func testSnakeTurnLeft() {
        let vector = self.snake.vector
        self.snake.left()
        
        XCTAssertEqual(snake.direction, .Left)
        XCTAssertNotEqual(vector, snake.vector)
    }
    
    func testSnakeTurnRight() {
        let vector = self.snake.vector
        self.snake.right()
        
        XCTAssertEqual(snake.direction, .Right)
        XCTAssertNotEqual(vector, snake.vector)
    }
    
    func testSnakeTurnUp() {
        let vector = self.snake.vector
        self.snake.up()
        
        XCTAssertEqual(snake.direction, .Up)
        XCTAssertNotEqual(vector, snake.vector)
    }
    
    func testSnakeTurnDown() {
        let vector = self.snake.vector
        self.snake.down()
        
        XCTAssertEqual(snake.direction, .Down)
        XCTAssertNotEqual(vector, snake.vector)
    }
    
    func testSnakeGrow() {
        let node = self.snake.grow()
        XCTAssertEqual(self.snake.tail.lenght, 1)
        XCTAssertNotNil(node)
    }
    
}
