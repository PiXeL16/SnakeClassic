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

class ScoreTest: XCTestCase {
    
    var score: Score!
    
    override func setUp() {
        super.setUp()
        
        self.score = Score(position: CGPoint.randomPoint(rangeHeight: 100, rangeWidth: 100))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScoreCorrectInitialValues() {
        
        XCTAssertNotNil(score.node)
        XCTAssertEqual(score.score, 0)
        XCTAssertEqual(self.score.scoreString, "0")
        XCTAssertNil(score.physicsBody)
        
    }
    
    func testAdvanceScore() {
        
        let scoreInitial  = self.score.score
        
        self.score.advanceScore()
        
        XCTAssertGreaterThan(score.score, scoreInitial)
 
    }
    
    func testClearScore() {
        
        self.score.advanceScore()
        self.score.advanceScore()
        
        self.score.clearScore()
        
        XCTAssertEqual(score.score, 0)
    }
    
    func testUpdateScore() {
        
        self.score.score = 40
        
        XCTAssertEqual(score.scoreLabel.text, "40")
    }
    
}
