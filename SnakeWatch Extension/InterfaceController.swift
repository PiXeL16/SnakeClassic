//
//  InterfaceController.swift
//  SnakeWatch Extension
//
//  Created by Chris Jimenez on 8/13/17.
//  Copyright © 2017 Chris Jimenez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var skInterface: WKInterfaceSKScene!
    
    var gameScene: GameScene!
    
    var crownValue: Double = 0.0
    var crownThreshold: Double  = 0.1
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        self.gameScene = GameScene(fileNamed: "GameScene")
        self.crownSequencer.delegate = self
        self.crownSequencer.focus()

        // Load the SKScene from 'GameScene.sks'
        if let scene = self.gameScene {
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            self.skInterface.presentScene(scene)
            
            // Use a value that will maintain a consistent frame rate
            self.skInterface.preferredFramesPerSecond = 30
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        self.gameScene.left()
    }

    @IBAction func swipeRight(_ sender: Any) {
        self.gameScene.right()
    }
    
    @IBAction func swipeUp(_ sender: Any) {
        self.gameScene.up()
    }
    
    @IBAction func swipeDown(_ sender: Any) {
        self.gameScene.down()
    }
}

extension InterfaceController: WKCrownDelegate {
    
    //MARK: Delegates
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        self.crownValue += rotationalDelta
    }
    
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        
        if crownValue > crownThreshold {
            self.gameScene.turnRight()
        } else if crownValue < -crownThreshold {
            self.gameScene.turnLeft()
        }
        
        self.crownValue = 0.0
    }
}

