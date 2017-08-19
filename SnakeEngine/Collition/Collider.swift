//
//  Collider.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

public protocol Collider {
    
    weak var world: World? { get }
    
    func handleCollition(contactBodyA: SKPhysicsBody, contactBodyB: SKPhysicsBody)
}
