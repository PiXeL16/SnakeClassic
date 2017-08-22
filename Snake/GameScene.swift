//
//  GameScene.swift
//  Snake
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import SpriteKit
import GameplayKit
import SnakeEngine
import UIKit

class GameScene: SKScene {
    
    var world: SnakeWorld!
    
    override func didMove(to view: SKView) {
        
        
        self.world = SnakeWorld(scene: self)
        
        self.setupControls()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.world.update(currentTime: currentTime)
        
    }
    
}

extension GameScene {
    
    internal func setupControls() {
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(sender:)))
        swipeLeft.direction = .left
        view?.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(sender:)))
        swipeRight.direction = .right
        view?.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(sender:)))
        swipeUp.direction = .up
        view?.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(sender:)))
        swipeDown.direction = .down
        view?.addGestureRecognizer(swipeDown)
    }
    
    func swipeLeft(sender: UISwipeGestureRecognizer){
        self.world.left()
    }
    
    func swipeRight(sender: UISwipeGestureRecognizer){
        self.world.right()
    }
    
    func swipeUp(sender: UISwipeGestureRecognizer){
        self.world.up()
    }
    
    func swipeDown(sender: UISwipeGestureRecognizer){
        self.world.down()
    }
    
}
