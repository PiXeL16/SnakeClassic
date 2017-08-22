//
//  World.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

public protocol WorldSettings {
    
    var velocity: CGFloat { get }
    var elementSize: CGSize { get }
    var timeFrameDelayer: Double { get }
    var margin: CGFloat { get }
}


extension WorldSettings {
    
    public var distance: CGFloat {
        return elementSize.height + margin
    }
}
