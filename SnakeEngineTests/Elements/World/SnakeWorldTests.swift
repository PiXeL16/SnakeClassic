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

class SnakeWorldTests: XCTestCase {
    
    var world: SnakeWorld!
    let size: CGFloat = 500
    var scene: SKScene!
    var view: SKView!
    
    override func setUp() {
        super.setUp()
        
        createScene()
        
        self.world = SnakeWorld(scene: scene)
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
        XCTAssertNotNil(world.collitionDetection)
        XCTAssertNotEqual(world.width, 0)
        XCTAssertNotEqual(world.height, 0)
        XCTAssertEqual(world.scene?.physicsWorld.gravity, CGVector(dx: 0, dy: 0))
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
    
    func testOnlyOneFoodInTheWorld() {
        
        world.createFood()
        
        XCTAssertNotNil(world.scene?.childNode(withName: Food(position: CGPoint.randomPoint(rangeHeight: 5, rangeWidth: 5)).name))
        
    }
    
    func testGrowSnake() {
        
        let nodesCount = world.scene?.children.count
        
        world.growSnake()
        
        let nodesAfterGrow = world.scene?.children.count
        
        XCTAssertGreaterThan(nodesAfterGrow!, nodesCount!)
    }
   
    func testSnakeEatFood() {
        
        let nodesCount: Int! = world.scene?.children.count
        let snakeSize = world.snake.body.count
        
        world.snakeEatFood()
        
        XCTAssertGreaterThan(world.snake.body.count, snakeSize)
        XCTAssertGreaterThan(world.scene!.children.count, nodesCount)
        
    }
    
    func testRestartGame() {
        
        world.growSnake()
        world.growSnake()
        world.growSnake()
        world.growSnake()
        
        world.restartGame()
        
        XCTAssertLessThan(world.scene!.children.count, 3)
        XCTAssertEqual(world.snake.body.count, 1)
    }
    
    func testUpdateCalledWithInterval() {
        
        let snakeMock = SnakeMock()
        self.world.snake = snakeMock
        
        let timeInterval = Date().timeIntervalSinceNow
        
        world.update(currentTime: timeInterval)
        world.update(currentTime: Date(timeIntervalSinceReferenceDate: timeInterval).addingTimeInterval(1000).timeIntervalSinceReferenceDate)
        
        XCTAssertEqual(snakeMock.updateCalled, true)
    }
    
    
    
}
