//
//  Snake.swift
//  Snake
//
//  Created by Chris Jimenez on 8/20/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal protocol Snake: Controllable {
    
    var head: Head { get set }
    var body: [SnakePart] { get set}
    var direction: Direction { get set }
    
    func grow() -> SKSpriteNode
    func update()
    
}
