//
//  StartScreen.swift
//  CodeDay Win
//
//  Created by Arnav Chawla on 11/13/16.
//  Copyright © 2016 Arnav Chawla. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
class StartScene: SKScene{
         var Start = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    var How = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    override func didMove(to view: SKView) {

        let game = SKSpriteNode(imageNamed: "StartScreen")
        game.setScale(1.2)
        game.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(game)
        
        Start.fontColor = SKColor.black
        Start.text = "START"
        Start.fontSize = 200
        Start.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        Start.zPosition = 200
        self.addChild(Start)
        How.fontColor = SKColor.black
        How.text = "HOW TO PLAY"
        How.fontSize = 160
        How.position = CGPoint(x: self.size.width/2, y: self.size.height/2-200)
        How.zPosition = 200
        self.addChild(How)
        
    }
    func  changeScene()
    {
        let sceneToMove = Garbage(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 1.25)
        self.view!.presentScene(sceneToMove,transition: my)
    }
    func  changeScene1()
    {
        let sceneToMove = File(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 1.25)
        self.view!.presentScene(sceneToMove,transition: my)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches
        {
            let point = touch.location(in: self)
            
            if Start.contains(point){
                changeScene()
            }
             if How.contains(point){
               changeScene1()
            }
    }
}

        
}
