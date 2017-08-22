//
//  CGRectExtensions.swift
//  Snake
//
//  Created by Chris Jimenez on 8/22/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

extension CGRect {
    
    
    func randomPointInRect() -> CGPoint {
        let origin = self.origin
        
        let randomX = CGFloat(arc4random_uniform(UInt32(self.width))) + origin.x
        let randomY = CGFloat(arc4random_uniform(UInt32(self.height))) + origin.y

        let point = CGPoint(x: randomX, y: randomY)
        return point
    }
    
    func randomPointInRectWithMargin(margin: CGFloat) -> CGPoint {
        
        let origin = self.origin
        
        let randomX = CGFloat(arc4random_uniform(UInt32(self.width - margin))) + origin.x
        let randomY = CGFloat(arc4random_uniform(UInt32(self.height - margin))) + origin.y
        
        let point = CGPoint(x: randomX, y: randomY)
        return point
        
    }
}
