//
//  Drawable.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

public protocol Drawable: class {

    var node: SKNode { get }
    var size: CGSize { get }
    var color: UIColor { get }
    
    func update()

}
