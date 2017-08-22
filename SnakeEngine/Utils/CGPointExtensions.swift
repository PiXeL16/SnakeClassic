//
//  CGPointExtensions.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation


extension CGPoint {
    
    static func randomPoint(rangeHeight: CGFloat, rangeWidth: CGFloat) -> CGPoint {
        
        let randomX = randomIntBetweenRange(lowerValue: -rangeWidth, upperValue: rangeWidth)
        let randomY = randomIntBetweenRange(lowerValue: -rangeHeight, upperValue: rangeHeight)
        
        let randomPosition = CGPoint(x: randomX, y: randomY)
        
        return randomPosition
    }
    
    
    static func randomIntBetweenRange(lowerValue: CGFloat, upperValue: CGFloat) -> Int {
        
        let lower: Int = Int(lowerValue)
        let upper: Int = Int(upperValue)
        
        let randomNumber = lower + Int(arc4random_uniform(UInt32(upper - lower + 1)));
        
        return randomNumber
    }
    
    
    func pointFromCurrentWithDistance(distance: CGFloat, angle: CGFloat) -> CGPoint {
        
        let radians: CGFloat = angle * CGFloat.pi / 180.0
        
        let xFromPoint = self.x + cos(radians) * distance
        let yFromPoint = self.y + sin(radians) * distance
        
        return CGPoint(x: xFromPoint, y: yFromPoint)
    }
    
    mutating func updateWithVector(vector: CGVector) {
        
        self.x = self.x + vector.dx
        self.y = self.y + vector.dy
        
    }
}
