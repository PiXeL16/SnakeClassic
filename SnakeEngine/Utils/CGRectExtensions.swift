//
//  CGRectExtensions.swift
//  Snake
//
//  Created by Chris Jimenez on 8/22/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

extension CGRect {
    
    func randomPointInRectWithMargin(margin: CGFloat) -> CGPoint {
        
        let origin = self.origin
        
        let xMin = origin.x + margin
        let xMax = (self.width / 2) - margin
        
        let yMin = origin.y + margin
        let yMax = (self.height / 2) - margin
        
        let randomX = CGFloat(arc4random_uniform(UInt32(1 + xMax - xMin))) + xMin
        let randomY = CGFloat(arc4random_uniform(UInt32(1 + yMax - yMin))) + yMin
        
        let point = CGPoint(x: randomX, y: randomY)
        return point
        
    }
}
