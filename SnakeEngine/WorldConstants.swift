//
//  World.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation


public struct WorldConstants {
    
    
    public static let velocity: CGFloat = 1
    public static let objectSize: CGSize = CGSize(width: 30, height: 30)
    public static let timeFrameDelayer:Double = 0.15
    public static let margin: CGFloat = 3.0
    
    public static var distance: CGFloat {
        return objectSize.height + margin
    }
    
}
