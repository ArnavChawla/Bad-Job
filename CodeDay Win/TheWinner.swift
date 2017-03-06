//
//  GameOverScene.swift
//  CodeDay Win
//
//  Created by Arnav Chawla on 11/12/16.
//  Copyright © 2016 Arnav Chawla. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
class TheWinner: SKScene{
    
    var home = SKSpriteNode(imageNamed: "Homeup")
    var a = SKSpriteNode(imageNamed: "--Arrow")
    var lable = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    override func didMove(to view: SKView) {
        let game = SKSpriteNode(imageNamed: "BossCover")
        game.setScale(1.1)
        game.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(game)
        lable.text = "Be Boss"
        
        lable.fontSize = 200
        lable.position = CGPoint(x: self.size.width/2, y: self.size.height/2 + 600 )
        lable.fontColor = SKColor.blue
         lable.zPosition = 200
        self.addChild(lable)
        home.position = CGPoint(x:self.size.width/2+400, y: self.size.height/2-800)
        home.zPosition = 200
        self.addChild(home)
        a.position = CGPoint(x: self.size.width/2-400, y: self.size.height/2-800)
        a.zPosition = 200
        a.setScale(0.8)
        self.addChild(a)
    }
    func  changeScene()
    {
        let sceneToMove = Rich(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMove,transition: my)
    }
    func  changeScen()
    {
        let sceneToMove = StartScene(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMove,transition: my)
    }
    func  changeScen1()
    {
        let sceneToMove = Garbage(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMove,transition: my)
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches
        {
            let point = touch.location(in: self)
            if lable.contains(point){
                changeScene()
            }
            if home.contains(point)
            {
                changeScen()
            }
            if a.contains(point)
            {
                changeScen1()
            }
        }
    }
    
}
