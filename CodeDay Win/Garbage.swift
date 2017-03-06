//
//  Garbage.swift
//  CodeDay Win
//
//  Created by Arnav Chawla on 11/13/16.
//  Copyright © 2016 Arnav Chawla. All rights reserved.
//

//
//  GameScene.swift
//  CodeDay Win
//
//  Created by Arnav Chawla on 11/12/16.
//  Copyright © 2016 Arnav Chawla. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
class Garbage: SKScene , SKPhysicsContactDelegate{
    var gamearea: CGRect
    var x : Bool = false
    var score = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    var gameScore = -1
    override init (size: CGSize)
    {
        let max : CGFloat = 16.0/9.0
        let play = size.height / max
        let marg = (size.width-play)/2
        gamearea = CGRect(x:marg ,y:0 ,width: play ,height: size.height)
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var boss = SKSpriteNode(imageNamed: "Boss")
    var player = SKSpriteNode(imageNamed: "GarbageBoy")
    let desk5 = SKSpriteNode(imageNamed: "trash")
    let desk4 = SKSpriteNode(imageNamed: "trash")
    let desk3 = SKSpriteNode(imageNamed: "trash")
    let desk2 = SKSpriteNode(imageNamed: "trash")
    let desk1 = SKSpriteNode(imageNamed: "trash")
    let desk = SKSpriteNode(imageNamed: "trash")
    struct PhysicsCatagories {
        static let None : UInt32 = 0
        static let Boss : UInt32 = 0b1//1
        static let desk : UInt32 = 0b10//2
        static let player : UInt32 = 0b100//3
        
    }
    override func didMove(to view: SKView) {
        
        score.text = "Score: "
        score.fontSize = 100
        score.position = CGPoint(x: self.size.width/2, y: self.size.height/2 + 900)
        self.addChild(score)
        self.physicsWorld.contactDelegate = self
        let background = SKSpriteNode(imageNamed: "Garbage")
        background.size = self.size
        background.zPosition = -1
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        desk.name = "desk"
        desk.zPosition = 1
        desk.position = CGPoint(x:self.size.width/2-400 ,y: self.size.height/2 + 600)
        desk.physicsBody = SKPhysicsBody(rectangleOf: desk.size)
        desk.physicsBody!.isDynamic = true
        desk.physicsBody!.affectedByGravity = false
        desk.physicsBody!.categoryBitMask = PhysicsCatagories.desk
        desk.physicsBody?.collisionBitMask = PhysicsCatagories.None
        desk.physicsBody?.contactTestBitMask = PhysicsCatagories.Boss|PhysicsCatagories.player
        
        self.addChild(desk)
        desk1.name = "desk"
        desk1.zPosition = 1
        desk1.position = CGPoint(x:self.size.width/2+400 ,y: self.size.height/2 + 600)
        desk1.physicsBody = SKPhysicsBody(rectangleOf: desk.size)
        desk1.physicsBody!.isDynamic = true
        
        desk1.physicsBody!.affectedByGravity = false
        desk1.physicsBody!.categoryBitMask = PhysicsCatagories.desk
        desk1.physicsBody?.collisionBitMask = PhysicsCatagories.None
        desk1.physicsBody?.contactTestBitMask = PhysicsCatagories.Boss|PhysicsCatagories.player
        self.addChild(desk1)
        desk2.name = "desk"
        desk2.zPosition = 1
        desk2.position = CGPoint(x:self.size.width/2-400 ,y: self.size.height/2)
        desk2.physicsBody = SKPhysicsBody(rectangleOf: desk.size)
        desk2.physicsBody!.affectedByGravity = false
        desk2.physicsBody!.categoryBitMask = PhysicsCatagories.desk
        desk2.physicsBody?.collisionBitMask = PhysicsCatagories.None
        desk2.physicsBody?.contactTestBitMask = PhysicsCatagories.Boss|PhysicsCatagories.player
        desk2.physicsBody!.isDynamic = true
        
        
        self.addChild(desk2)
        
        desk3.name = "desk"
        desk3.zPosition = 1
        desk3.position = CGPoint(x:self.size.width/2+400 ,y: self.size.height/2)
        desk3.physicsBody = SKPhysicsBody(rectangleOf: desk.size)
        desk3.physicsBody!.isDynamic = true
        desk3.physicsBody!.affectedByGravity = false
        desk3.physicsBody!.categoryBitMask = PhysicsCatagories.desk
        desk3.physicsBody?.collisionBitMask = PhysicsCatagories.None
        desk3.physicsBody?.contactTestBitMask = PhysicsCatagories.Boss|PhysicsCatagories.player
        
        self.addChild(desk3)
        
        desk4.name = "desk"
        desk4.zPosition = 1
        desk4.position = CGPoint(x:self.size.width/2-400 ,y: self.size.height/2 - 600)
        desk4.physicsBody = SKPhysicsBody(rectangleOf: desk.size)
        desk4.physicsBody!.isDynamic = true
        
        desk4.physicsBody!.affectedByGravity = false
        desk4.physicsBody!.categoryBitMask = PhysicsCatagories.desk
        desk4.physicsBody?.collisionBitMask = PhysicsCatagories.None
        desk4.physicsBody?.contactTestBitMask = PhysicsCatagories.Boss|PhysicsCatagories.player
        
        
        self.addChild(desk4)
        
        desk5.name = "desk"
        desk5.zPosition = 1
        desk5.position = CGPoint(x:self.size.width/2+400 ,y: self.size.height/2 - 600)
        desk5.physicsBody = SKPhysicsBody(rectangleOf: desk.size)
        desk5.physicsBody!.isDynamic = true
        
        desk5.physicsBody!.affectedByGravity = false
        desk5.physicsBody!.categoryBitMask = PhysicsCatagories.desk
        desk5.physicsBody?.collisionBitMask = PhysicsCatagories.None
        desk5.physicsBody?.contactTestBitMask = PhysicsCatagories.Boss | PhysicsCatagories.player
        
        self.addChild(desk5)
        boss.setScale(1)
        boss.physicsBody = SKPhysicsBody(rectangleOf: boss.size)
        boss.physicsBody!.affectedByGravity = false
        boss.physicsBody!.categoryBitMask = PhysicsCatagories.Boss
        boss.physicsBody?.collisionBitMask = PhysicsCatagories.None
        boss.physicsBody?.contactTestBitMask = PhysicsCatagories.desk
        
        boss.position = CGPoint(x: self.size.width/2 + 300 ,  y: self.size.height/2 - 900)
        self.addChild(boss)
        player.setScale(1)
        player.zPosition = 1
        player.position = CGPoint(x: self.size.width/2  ,  y: self.size.height/2)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: boss.size )
        player.physicsBody!.categoryBitMask = PhysicsCatagories.player
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.isDynamic = true
        player.physicsBody!.friction=10.2
        player.zPosition = 5
        player.physicsBody!.collisionBitMask = PhysicsCatagories.None
        player.physicsBody!.contactTestBitMask = PhysicsCatagories.desk | PhysicsCatagories.Boss
        
        self.addChild(player)
        
        
        
        
    }
    func  changeScene()
    {
        let sceneToMove = Promotion(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 1.25)
        self.view!.presentScene(sceneToMove,transition: my)
    }

    func  changeScene1()
    {
        let sceneToMove = Last(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 1.25)
        self.view!.presentScene(sceneToMove,transition: my)
    }

    func addScore()
    {
        gameScore += 1
        score.text = "Score: \(gameScore)"
    }
    
    
    func didBegin(_ contact: SKPhysicsContact)  {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask
        {
            body1 = contact.bodyA
            body2 = contact.bodyB
            
        }
        if body2.categoryBitMask == PhysicsCatagories.Boss && body1.categoryBitMask == PhysicsCatagories.desk
        {
            boss.speed = 0.0
            boss.position = CGPoint(x: self.size.width/2+300, y: self.size.height/2-900)
        }
        if body1.categoryBitMask == PhysicsCatagories.desk &&  body2.categoryBitMask == PhysicsCatagories.player
        {
            x=true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                // Put your code which should be executed with a delay here
                
                self.x = false
                
            })
        }
        if body1.categoryBitMask == PhysicsCatagories.Boss &&  body2.categoryBitMask == PhysicsCatagories.player
        {
            changeScene1()
        }
        
    }
    var previousPosition = CGPoint()
    override func update(_ currentTime: TimeInterval) {
        //initialize random variable p
        var p = arc4random_uniform(9)
        
        //define actions
        let run1 = SKAction.moveTo(x: self.size.width/2 + 600 , duration: 5)
        let run2 = SKAction.moveTo(x: self.size.width/2 - 600 , duration: 5)
        let run3 = SKAction.moveTo(y: self.size.height/2 + 600 , duration: 5)
        let run4 = SKAction.moveTo(y: self.size.height/2 - 600 , duration: 5)
        
        //run actions based on random number
        if p == 1 || p == 2  && boss.position.x < self.size.width/2
        {
            self.boss.run(run1)
        }
        else if p == 3 || p == 4  && boss.position.x > self.size.width/2
        {
            self.boss.run(run2)
        }
            
        else if p == 5 || p == 6  && boss.position.x < self.size.height/2
        {
            self.boss.run(run3)
        }
            
        else if p == 7 || p == 8  && boss.position.x > self.size.height/2
        {
            self.boss.run(run4)
        }
        
        
        //check for boss being out game area
        if(boss.position.y>gamearea.maxY)
        {
            boss.position.y = gamearea.maxY
        }
        if(boss.position.y<gamearea.minY)
        {
            boss.position.y = gamearea.minY
        }
        if(boss.position.x>gamearea.maxX)
        {
            boss.position.x = gamearea.maxX
        }
        if(boss.position.x<gamearea.minX)
        {
            boss.position.y = gamearea.minX
        }
        
        //check for player passing center line
        if(player.position.y>=1024  && previousPosition.y<1024)
        {
            addScore()
            
        }
        else if(previousPosition.y>1024 && player.position.y<=1024)
        {
            addScore()
            
        }
        previousPosition = player.position
        if gameScore == 15
        {
            changeScene()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            if x==false
            {
                let location = touch.location(in: self)
                let newLocation = touch.previousLocation(in:self)
                let amountdragged = location.y - newLocation.y
                let bleh  = location.x - newLocation.x
                player.position.y += amountdragged
                player.position.x += bleh
                if(player.position.x>gamearea.maxX)
                {
                    player.position.x = gamearea.maxX
                }
                if(player.position.x<gamearea.minX)
                {
                    player.position.x = gamearea.minX
                }
                if(player.position.y>gamearea.maxY)
                {
                    player.position.y = gamearea.maxY
                }
                if(player.position.y<gamearea.minY)
                {
                    player.position.y = gamearea.minY
                }

            }
            
        }
        
        
    }
    
}
