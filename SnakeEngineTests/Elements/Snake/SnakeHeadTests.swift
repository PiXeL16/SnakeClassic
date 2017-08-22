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
        let position =  self.snakeHead.node.position
        
        self.snakeHead.left()
        self.snakeHead.update()
        
        XCTAssertNotEqual(vector, snakeHead.vector)
        XCTAssertNotEqual(position, snakeHead.node.position)
    }
    
    func testSnakeTurnRight() {
        let vector = self.snakeHead.vector
        let position =  self.snakeHead.node.position
        
        self.snakeHead.right()
        self.snakeHead.update()
        
        XCTAssertNotEqual(vector, snakeHead.vector)
        XCTAssertNotEqual(position, snakeHead.node.position)
    }
    
    func testSnakeTurnUp() {
        let vector = self.snakeHead.vector
        let position =  self.snakeHead.node.position
        
        self.snakeHead.up()
        self.snakeHead.update()
        
        XCTAssertNotEqual(vector, snakeHead.vector)
        XCTAssertNotEqual(position, snakeHead.node.position)
    }
    
    func testSnakeTurnDown() {
        let vector = self.snakeHead.vector
        let position =  self.snakeHead.node.position
        
        self.snakeHead.down()
        self.snakeHead.update()
        
        XCTAssertNotEqual(vector, snakeHead.vector)
        XCTAssertNotEqual(position, snakeHead.node.position)
    }
}
