//
//  SnakeTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import XCTest
@testable import SnakeEngine

class SnakeHeadTests: XCTestCase {
    
    var snakeHead: Head!
    
    override func setUp() {
        super.setUp()
        
        self.snakeHead = Head()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSnakeInitializeWithCorrectValues() {
        
        XCTAssertNotNil(snakeHead.node)
        XCTAssertEqual(snakeHead.vector, CGVector(dx: 0, dy: 0))
        XCTAssertNotNil(snakeHead.name)
        XCTAssertEqual(snakeHead.node.name, snakeHead.name)
        XCTAssertNotNil(snakeHead.physicsBody)
        
    }
    
    
    func testSnakeTurnLeft() {
        let vector = self.snakeHead.vector
        self.snakeHead.left()
        
        XCTAssertEqual(snakeHead.direction, .Left)
        XCTAssertNotEqual(vector, snakeHead.vector)
    }
    
    func testSnakeTurnRight() {
        let vector = self.snakeHead.vector
        self.snakeHead.right()
        
        XCTAssertEqual(snakeHead.direction, .Right)
        XCTAssertNotEqual(vector, snakeHead.vector)
    }
    
    func testSnakeTurnUp() {
        let vector = self.snakeHead.vector
        self.snakeHead.up()
        
        XCTAssertEqual(snakeHead.direction, .Up)
        XCTAssertNotEqual(vector, snakeHead.vector)
    }
    
    func testSnakeTurnDown() {
        let vector = self.snakeHead.vector
        self.snakeHead.down()
        
        XCTAssertEqual(snakeHead.direction, .Down)
        XCTAssertNotEqual(vector, snakeHead.vector)
    }
}
