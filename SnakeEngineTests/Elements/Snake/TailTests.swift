//
//  SnakeTests.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import XCTest
@testable import SnakeEngine

class TailTests: XCTestCase {
    
    var tail: Tail!
    
    override func setUp() {
        super.setUp()
        
        self.tail = Tail()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTailInitializeWithCorrectValues() {
        
        XCTAssertTrue(self.tail.sections.isEmpty)
        
    }
    
    func testAddTailSection() {
        
        let section = self.tail.addSection(position: CGPoint(), vector: CGVector(dx: 5, dy: 5))
        
        XCTAssertFalse(self.tail.sections.isEmpty)
        XCTAssertEqual(self.tail.sections.count, 1)
        XCTAssertNotNil(section.node)
    }
    
}
