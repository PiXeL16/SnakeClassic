//
//  Drawable.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

public protocol Drawable {

    var node: SKSpriteNode { get set }
    var color: UIColor { get set }

}
