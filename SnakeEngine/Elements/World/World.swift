//
//  World.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit

internal protocol World: class, Controllable {
    
    weak var scene: SKScene? { get }
    
    var snake: Snake! { get set }
    var food: Food! { get set }
    var height: CGFloat { get }
    var width: CGFloat  { get }
    var collitionDetection: Collider! { get set }
    
    func update()
    func createSnake()
    func growSnake()
    func createFood()
    func restartGame()
}
