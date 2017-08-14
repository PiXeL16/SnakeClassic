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

class CGPointExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRandomPointGenerated() {
        
        let height: CGFloat = 500
        let width: CGFloat = 600
        
        let point = CGPoint.randomPoint(rangeHeight: height, rangeWidth: width)
        
        XCTAssertLessThan(point.y, height)
        XCTAssertLessThan(point.x, width)
    }
    
    
    func testRandomIntBetweenRange() {
        
        let lowerRange: CGFloat = -500
        let upperRange: CGFloat = 800
        let randomValue = CGPoint.randomIntBetweenRange(lowerValue: lowerRange, upperValue: upperRange)
        
        XCTAssertLessThan(randomValue, Int(upperRange))
        XCTAssertGreaterThan(randomValue, Int(lowerRange))
        
    }
    
}
