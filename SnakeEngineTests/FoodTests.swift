//
//  FoodTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/14/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import XCTest
@testable import SnakeEngine

class FoodTests: XCTestCase {
    
    var food: Food!
    let range: CGFloat = 100
    
    override func setUp() {
        super.setUp()
        
        self.food = Food(position: CGPoint.randomPoint(rangeHeight: range, rangeWidth: range))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFoodInitializeWithCorrectValues() {
        
        XCTAssertNotNil(food.node)
        XCTAssertNotNil(food.physicsBody)
        XCTAssertEqual(food.node.name, food.name)
        XCTAssertLessThan(food.node.position.x, range)
        XCTAssertLessThan(food.node.position.y, range)
        
    }
}
