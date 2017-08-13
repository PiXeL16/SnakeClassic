//
//  Movable.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

public protocol Movable {
    
    var direction: Direction { get set }
    
    var velocity: CGVector { get set }

}
