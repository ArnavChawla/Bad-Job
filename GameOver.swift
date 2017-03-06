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
import GoogleMobileAds
class GameOverScene: SKScene{
    
    var interstitial: GADInterstitial!
    fileprivate func createAndLoadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3743323698792107/8133954876")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        interstitial.load(request)
        
    }
//   var roll = arc4random_uniform(6) + 1 // 1...6
   let  roll = 3
    var home = SKSpriteNode(imageNamed: "Homeup")

      var lable = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    override func didMove(to view: SKView) {
        let game = SKSpriteNode(imageNamed: "GameOver")
        game.setScale(1.2)
        game.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(game)
        lable.text = "Play Again"
        lable.fontSize = 200
        lable.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 400 )
        lable.fontColor = SKColor.white
        lable.zPosition = 200
        self.addChild(lable)
        home.position = CGPoint(x:self.size.width/2, y: self.size.height/2-800)
        home.zPosition = 200
        self.addChild(home)
    
    }
    func  changeScene()
    {
        let sceneToMove = Garbage(size: self.size)
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
        if roll == 3
        {
            createAndLoadInterstitial()
        }
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
        }
    }
    
}
