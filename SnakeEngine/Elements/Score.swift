//
//  Food.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit

internal class Score: WorldElement {
    
    internal let ScoreMultiplier = 10
    
    var physicsBody: SKPhysicsBody?
    
    var scoreLabel: SKLabelNode
    
    let settings = SettingsFactory.buildSettings()
    
    var score: Int = 0{
        didSet {
            self.updateScore()
        }
    }
    
    init(position: CGPoint) {
        
        self.scoreLabel = SKLabelNode(fontNamed: "DINCondensed-Bold")
        self.scoreLabel.position = position
        self.scoreLabel.color = self.color
        self.scoreLabel.fontColor = self.color
        self.scoreLabel.fontSize = 30 * settings.margin
        self.clearScore()
    
    }
    
    var color: UIColor {
        return UIColor.black
    }
    
    var node: SKNode {
        return self.scoreLabel
    }
    
    var size: CGSize {
        return CGSize()
    }
    
    func update(){}
    
}

extension Score {
    
    var scoreString: String {
        return String(score)
    }
    
    public func clearScore() {
        self.score = 0
    }
    
    public func advanceScore() {
        self.score = score + self.ScoreMultiplier
    }
    
    
    internal func updateScore() {
        
        self.scoreLabel.text = scoreString
    }
}


extension Score: Physical {
    
    var contactCategory: UInt32 {
        return CollitionCategory.NoCollition.rawValue
    }
    
    var collidesWithCategory: UInt32 {
        return CollitionCategory.NoCollition.rawValue
    }
}


extension Score: Nameable {
    
    var name: String {
        return "Score"
    }
}
