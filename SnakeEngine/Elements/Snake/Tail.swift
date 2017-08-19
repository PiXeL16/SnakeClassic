//
//  Tail.swift
//  Snake
//
//  Created by Chris Jimenez on 8/19/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import Foundation
import SpriteKit
public class Tail {
    
    var sections: [TailSection]
    
    var lenght: Int {
        return sections.count
    }
    
    init() {
        sections = [TailSection]()
    }
    
    func addSection(withReference drawable: Drawable) -> TailSection {
        
        let section = TailSection(reference: drawable)
        sections.append(section)
        
        return section
    }
    
    func addNextSection() -> TailSection {
        
        //TODO: Add error handling
        let section = self.sections.last!
     
        let newTailSection = self.addSection(withReference: section)
        
        return newTailSection
    }
    
}
