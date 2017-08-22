//
//  SettingsFactory.swift
//  Snake
//
//  Created by Chris Jimenez on 8/23/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation

public class SettingsFactory {
    
    public static func buildSettings() -> WorldSettings {
        #if os(iOS)
            return PhoneSetting()
        #elseif os(watchOS)
            return WatchSettings()
        #endif
    }
}
