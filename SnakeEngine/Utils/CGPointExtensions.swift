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
        
        let randomPosition = CGPoint(x: CGFloat(arc4random() % UInt32(rangeWidth)),
                                     y: CGFloat(arc4random() % UInt32(rangeHeight)))
        
        return randomPosition
    }
}
