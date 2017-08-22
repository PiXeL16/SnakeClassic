//
//  SnakeTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import XCTest
@testable import SnakeEngine

class DirectionTests: XCTestCase {
    
    func testAngles() {
        
        XCTAssertEqual(Direction.Up.angle, 90)
        XCTAssertEqual(Direction.Right.angle, 0)
        XCTAssertEqual(Direction.Down.angle, 270)
        XCTAssertEqual(Direction.Left.angle, 180)
    }
    
}
