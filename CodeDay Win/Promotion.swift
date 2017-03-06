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
class Promotion: SKScene{
    
    var home = SKSpriteNode(imageNamed: "Homeup")
    let arrow = SKSpriteNode(imageNamed: "Arrow")
   // var lable = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    override func didMove(to view: SKView) {
        let game = SKSpriteNode(imageNamed: "Promoted")
        game.setScale(1.2)
        game.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(game)
        //lable.text = "Go To Work "
        //lable.fontSize = 200
        //lable.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 400 )
        //lable.fontColor = SKColor.white
        //self.addChild(lable)
        home.position = CGPoint(x:self.size.width/2-300, y: self.size.height/2-600)
        arrow.position = CGPoint(x:self.size.width/2+300, y: self.size.height/2-600)
        arrow.zPosition = 200
        arrow.setScale(0.8)
        home.zPosition = 200
        self.addChild(arrow)
        self.addChild(home)
    }
    func  changeScene()
    {
        let sceneToMove = GameScene(size: self.size)
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches
        {
            let point = touch.location(in: self)
            if arrow.contains(point){
                changeScene()
            }
            if home.contains(point)
            {
                changeScen()
            }
            
        }
    }
    
}
