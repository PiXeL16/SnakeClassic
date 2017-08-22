//
//  PhoneSettings.swift
//  Snake
//
//  Created by Chris Jimenez on 8/23/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

public struct PhoneSetting: WorldSettings {
    
    public let velocity: CGFloat = 1
    public let elementSize: CGSize = CGSize(width: 30, height: 30)
    public let timeFrameDelayer:Double = 0.15
    public let margin: CGFloat = 3.0
    
    public init(){}
    
}
