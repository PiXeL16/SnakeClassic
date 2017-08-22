//
//  SnakeImplementationTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/20/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import XCTest
@testable import SnakeEngine

class SnakeImplementationTests: XCTestCase {
    
    var snake: Snake!
    
    override func setUp() {
        super.setUp()
        
        self.snake = SnakeImplementation()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSnakeInitWithCorrectValues() {
        
        XCTAssertNotNil(snake.head)
        XCTAssertNotNil(snake.body)
        XCTAssertEqual(snake.body.count, 1)
        XCTAssertEqual(snake.direction, Direction.None)
    }
    
    
    func testSnakeCanTurnLeft() {
        
        snake.left()
        
        XCTAssertEqual(snake.direction, .Left)
    }
    
    func testSnakeCantTurnLeft() {
        
        snake.right()
        snake.left()
        
        XCTAssertEqual(snake.direction, .Right)
    }
    
    func testSnakeCanTurnRight() {
        
        snake.right()
        
        XCTAssertEqual(snake.direction, .Right)

    }
    
    func testSnakeCantTurnRight() {
        
        snake.left()
        snake.right()
        
        XCTAssertEqual(snake.direction, .Left)
        
    }
    
    func testSnakeCanTurnUp() {
        
        snake.up()
        
        XCTAssertEqual(snake.direction, .Up)

    }
    
    func testSnakeCantTurnUp() {
        
        snake.down()
        snake.up()
        
        XCTAssertEqual(snake.direction, .Down)

    }
    
    func testSnakeCanTurnDown() {
        
        snake.down()
        
        XCTAssertEqual(snake.direction, .Down)
    }
    
    func testSnakeCantTurnDown() {
        
        snake.up()
        snake.down()
        
        XCTAssertEqual(snake.direction, .Up)
    }
    
    func testSnakeGrow() {
        
        let bodySize = snake.body.count
        
        let _ = snake.grow()
        
        XCTAssertGreaterThan(snake.body.count, bodySize)
        
    }
    
    func testSnakeUpdate() {
        
        let _ = snake.grow()
        let _ = snake.grow()
        
        snake.up()
        snake.update()
        snake.update()
        
        XCTAssertNotEqual(snake.body[0].node.position, snake.body[1].node.position)
        
        XCTAssertNotEqual(snake.body[1].node.position, snake.body[2].node.position)
    }
    
}

