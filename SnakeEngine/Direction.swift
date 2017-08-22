//
//  Direction.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

public enum Direction {
    case Up
    case Down
    case Left
    case Right
    case None
    
    var angle: Int {
        
        switch self {
        case .Up:
            return 90
        case .Down:
            return 270
        case .Left:
            return 180
        case .Right:
            return 0
        default:
            return 0
        }
    }
    
    var inverseAngle: Int {
        
        switch self {
        case .Up:
            return 270
        case .Down:
            return 90
        case .Left:
            return 0
        case .Right:
            return 180
        default:
            return 0
        }

    }
}
