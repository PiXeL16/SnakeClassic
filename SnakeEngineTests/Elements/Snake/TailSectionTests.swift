//
//  SnakeTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import XCTest
@testable import SnakeEngine

class TailSectionTests: XCTestCase {
    
    var tailSection: TailSection!
    
    override func setUp() {
        super.setUp()
        
        let point = CGPoint(x: 0, y: 0)
        let vector = CGVector(dx: 50, dy: 50)
        
        self.tailSection = TailSection(position: point, vector: vector)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSnakeInitializeWithCorrectValues() {
        
        XCTAssertEqual(tailSection.direction, .None)
        XCTAssertNotNil(tailSection.node)
        XCTAssertEqual(tailSection.vector, CGVector(dx: 50, dy: 50))
        XCTAssertNotNil(tailSection.name)
        XCTAssertEqual(tailSection.node.name, tailSection.name)
        XCTAssertNotNil(tailSection.physicsBody)
        
    }
    
}
