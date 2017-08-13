//
//  Physical.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal protocol Physical {
    
    var physicsBody: SKPhysicsBody? { get }
    
    func initPhysicsBodyCharacteristics()
    
}


