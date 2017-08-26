//
//  CGPointExtensionsTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//
import XCTest
import Foundation
@testable import SnakeEngine

class CGRectExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRandomPointGeneratedInsideRect() {
        
        let rect = CGRect(x: -500, y: -700, width: 500, height: 700)
        
        let point =  rect.randomPointInRectWithMargin(margin: 50)
        
        XCTAssertLessThan(point.x, rect.width)
        XCTAssertLessThan(point.y, rect.height)
        XCTAssertGreaterThan(point.x, rect.minX)
        XCTAssertGreaterThan(point.y, rect.minY)
    }
    
}
