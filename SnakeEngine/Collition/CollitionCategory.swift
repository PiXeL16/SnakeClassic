//
//  ContactCategory.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation


internal enum CollitionCategory: UInt32 {
    
    case SnakeHead = 1
    case Food = 2
    case SnakeTail = 4
    case Border = 8
    case NoCollition = 1000
    
}
