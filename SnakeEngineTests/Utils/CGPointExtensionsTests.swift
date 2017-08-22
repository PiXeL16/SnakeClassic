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
    
    
    func testUpdatePointWithVector() {
        
        var point = CGPoint(x: 10, y: 10)
        let vector = CGVector(dx: 5, dy: 5)
        point.updateWithVector(vector: vector)
        
        XCTAssertEqual(point.x, 15)
        XCTAssertEqual(point.y, 15)
    }
    
    func testPointFromCurrentWithDistanceAnd90Angle() {
        
        let point = CGPoint(x: 0.0, y: 0.0)
        
        let newPoint = point.pointFromCurrentWithDistance(distance: 30, angle: 90)
        
        XCTAssertEqual(Int(newPoint.x), 0)
        XCTAssertEqual(Int(newPoint.y), 30)
    }
    
    func testPointFromCurrentWithDistanceAnd180Angle() {
        
        let point = CGPoint(x: 0.0, y: 0.0)
        
        let newPoint = point.pointFromCurrentWithDistance(distance: 30, angle: 180)
        
        XCTAssertEqual(Int(newPoint.x), -30)
        XCTAssertEqual(Int(newPoint.y), 0)
    }
    
}
