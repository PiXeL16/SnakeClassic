//
//  Movable.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

public protocol Movable {
    
    var vector: CGVector { get set }
    
    var direction: Direction { get set }
    
    func move(vector: CGVector)
    

}
