//
//  SnakeTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//
import UIKit
import SpriteKit
import XCTest
@testable import SnakeEngine

class WorldTests: XCTestCase {
    
    var world: World!
    let size: CGFloat = 500
    var scene: SKScene!
    var view: SKView!
    
    override func setUp() {
        super.setUp()
        
        createScene()
        
        self.world = World(scene: scene)
    }
    
    private func createScene()  {
        
        self.view = SKView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        
        self.scene = SKScene(size: CGSize(width: size, height: size))
        
        self.view.presentScene(scene)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWorldInitializeWithCorrectValues() {
        
        XCTAssertNotNil(world.snake)
        XCTAssertNotNil(world.food)
        XCTAssertNotEqual(world.width, 0)
        XCTAssertNotEqual(world.height, 0)
    }
    
    func testRight() {
        world.right()
        XCTAssertEqual(world.snake.direction, .Right)
    }
    
    func testLeft() {
        world.left()
        XCTAssertEqual(world.snake.direction, .Left)
    }
    
    func testUp() {
        world.up()
        XCTAssertEqual(world.snake.direction, .Up)
    }
    
    func testDown() {
        world.down()
        XCTAssertEqual(world.snake.direction, .Down)
    }
    
    func testCreateFood() {
        world.createFood()
        
        XCTAssertNotNil(world.food)
        XCTAssertLessThan(world.food.node.position.x, size)
        XCTAssertLessThan(world.food.node.position.y, size)
    }
   
    
}
